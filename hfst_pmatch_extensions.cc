#include "parsers/PmatchCompiler.h"

namespace hfst {

  //hfst::ImplementationType get_default_fst_type();

// Mostly copied from file 'tools/src/hfst-pmatch2fst.cc'.
// TODO: HfstTransducer pointers in variable 'definitions' need to be deleted manually?
std::vector<hfst::HfstTransducer> compile_pmatch_expression(const std::string & pmatch)
{
    std::vector<hfst::HfstTransducer> retval;
    hfst::pmatch::PmatchCompiler comp(hfst::TROPICAL_OPENFST_TYPE);
    comp.set_verbose(false/*verbose*/);
    comp.set_flatten(false/*flatten*/);
    std::map<std::string, hfst::HfstTransducer*> definitions = comp.compile(pmatch);

    // A dummy transducer with an alphabet with all the symbols
    hfst::HfstTransducer harmonizer(hfst::TROPICAL_OPENFST_TYPE);

    // First we need to collect a unified alphabet from all the transducers.
    hfst::StringSet symbols_seen;
    for (std::map<std::string, hfst::HfstTransducer *>::const_iterator it =
             definitions.begin(); it != definitions.end(); ++it) {
        hfst::StringSet string_set = it->second->get_alphabet();
        for (hfst::StringSet::const_iterator sym = string_set.begin();
             sym != string_set.end(); ++sym) {
            if (symbols_seen.count(*sym) == 0) {
              harmonizer.disjunct(hfst::HfstTransducer(*sym, hfst::TROPICAL_OPENFST_TYPE));
                symbols_seen.insert(*sym);
            }
        }
    }
    if (symbols_seen.size() == 0) {
        // We don't recognise anything, go home early
        std::cerr << "Empty ruleset, nothing to write\n";
        throw HfstException(); // TODO
    }

    // Then we convert it...
    harmonizer.convert(hfst::HFST_OLW_TYPE);
    // Use these for naughty intermediate steps to make sure
    // everything has the same alphabet
    hfst::HfstBasicTransducer * intermediate_tmp;
    hfst_ol::Transducer * harmonized_tmp;
    hfst::HfstTransducer * output_tmp;

    // When done compiling everything, look for TOP and output it first.
    if (definitions.count("TOP") == 1) {
        intermediate_tmp = hfst::implementations::ConversionFunctions::
            hfst_transducer_to_hfst_basic_transducer(*definitions["TOP"]);
        harmonized_tmp = hfst::implementations::ConversionFunctions::
            hfst_basic_transducer_to_hfst_ol(intermediate_tmp,
                                             true, // weighted
                                             "", // no special options
                                             &harmonizer); // harmonize with this
        output_tmp = hfst::implementations::ConversionFunctions::
            hfst_ol_to_hfst_transducer(harmonized_tmp);
        output_tmp->set_name("TOP");
        retval.push_back(*output_tmp);
        delete definitions["TOP"];
        definitions.erase("TOP");
        delete intermediate_tmp;
        delete output_tmp;

        for (std::map<std::string, hfst::HfstTransducer *>::iterator it =
                 definitions.begin(); it != definitions.end(); ++it) {
            intermediate_tmp = hfst::implementations::ConversionFunctions::
                hfst_transducer_to_hfst_basic_transducer(*(it->second));
            harmonized_tmp = hfst::implementations::ConversionFunctions::
                hfst_basic_transducer_to_hfst_ol(intermediate_tmp,
                                                 true, // weighted
                                                 "", // no special options
                                                 &harmonizer); // harmonize with this
            output_tmp = hfst::implementations::ConversionFunctions::
                hfst_ol_to_hfst_transducer(harmonized_tmp);
            output_tmp->set_name(it->first);
            retval.push_back(*output_tmp);
            delete it->second;
            delete intermediate_tmp;
            delete output_tmp;
        }
    } else {
        std::cerr << "Empty ruleset, nothing to write\n";
        throw HfstException(); // TODO
    }
    return retval;
 }
}
