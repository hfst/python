namespace hfst {

// *** Wrapper variables for IOString outputs *** //

std::string hfst_regex_error_message("");
std::string get_hfst_regex_error_message() { return hfst::hfst_regex_error_message; }

hfst::HfstTransducer * hfst_regex(hfst::xre::XreCompiler & comp, const std::string & regex_string, const std::string & error_stream)
{
        hfst_regex_error_message="";
        
        if (error_stream == "cout")
        {
          comp.set_error_stream(&std::cout);
          return comp.compile(regex_string);
        }
        else if (error_stream == "cerr")
        {
          comp.set_error_stream(&std::cerr);
          return comp.compile(regex_string);
        }
        else
        {
          std::ostringstream os(std::ostringstream::ate);
          comp.set_error_stream(&os);
          hfst::set_warning_stream(&os);
          hfst::HfstTransducer * retval = comp.compile(regex_string);
          hfst_regex_error_message = os.str();
          hfst::set_warning_stream(&std::cerr);
          return retval;
        }
}

}
