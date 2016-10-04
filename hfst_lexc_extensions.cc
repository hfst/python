namespace hfst {

// *** Wrapper variables for IOString outputs *** //

std::string hfst_lexc_output("");
std::string get_hfst_lexc_output() { return hfst::hfst_lexc_output; }

hfst::HfstTransducer * hfst_compile_lexc(hfst::lexc::LexcCompiler & comp, const std::string & filename, const std::string & error_stream)
{
        hfst_lexc_output="";

        if (error_stream == "cout")
        {
          comp.set_error_stream(&std::cout);
          if (comp.getVerbosity() > 1)
            std::cout << "Parsing the lexc file..." << std::endl;
          comp.parse(filename.c_str());
          if (comp.getVerbosity() > 1)
            std::cout << "Compiling..." << std::endl;
          hfst::HfstTransducer * retval = comp.compileLexical();
          if (comp.getVerbosity() > 1)
            std::cout << "Compilation done." << std::endl;
          return retval;
        }
        else if (error_stream == "cerr")
        {
          comp.set_error_stream(&std::cerr);
          if (comp.getVerbosity() > 1)
            std::cerr << "Parsing the lexc file..." << std::endl;
          comp.parse(filename.c_str());
          if (comp.getVerbosity() > 1)
            std::cerr << "Compiling..." << std::endl;
          hfst::HfstTransducer * retval = comp.compileLexical();
          if (comp.getVerbosity() > 1)
            std::cerr << "Compilation done." << std::endl;
          return retval;
        }
        else
        {
          std::ostringstream os(std::ostringstream::ate);
          comp.set_error_stream(&os);
          hfst::set_warning_stream(&os);
          if (comp.getVerbosity() > 1)
            os << "Parsing the lexc file..." << std::endl;
          comp.parse(filename.c_str());
          if (comp.getVerbosity() > 1)
            os << "Compiling..." << std::endl;
          hfst::HfstTransducer * retval = comp.compileLexical();
          if (comp.getVerbosity() > 1)
            os << "Compilation done." << std::endl;
          hfst_lexc_output = os.str();
          hfst::set_warning_stream(&std::cerr);
          return retval;
        }
}

}
