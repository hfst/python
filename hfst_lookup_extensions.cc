namespace hfst {

std::string one_level_paths_to_string(const hfst::HfstOneLevelPaths & paths)
{
    std::ostringstream oss;
    for(hfst::HfstOneLevelPaths::const_iterator it = paths.begin(); it != paths.end(); it++)
    {
      for (hfst::StringVector::const_iterator svit = it->second.begin(); svit != it->second.end(); svit++)
      {
        oss << *svit;
      }
      oss << "\t" << it->first << std::endl;
    }
    return oss.str();
}

hfst::HfstOneLevelPaths extract_output_side(const hfst::HfstTwoLevelPaths & paths)
{
    hfst::HfstOneLevelPaths result;
    for(hfst::HfstTwoLevelPaths::const_iterator it = paths.begin(); it != paths.end(); it++)
    {
      hfst::StringVector sv;
      for (hfst::StringPairVector::const_iterator svit = it->second.begin(); svit != it->second.end(); svit++)
      {
        sv.push_back(svit->second);
      }
      result.insert(std::pair<float, hfst::StringVector>(it->first, sv));
    }
    return result;
}

std::string two_level_paths_to_string(const hfst::HfstTwoLevelPaths & paths)
{
    std::ostringstream oss;
    for(hfst::HfstTwoLevelPaths::const_iterator it = paths.begin(); it != paths.end(); it++)
    {
      std::string input("");
      std::string output("");
      for (hfst::StringPairVector::const_iterator svit = it->second.begin(); svit != it->second.end(); svit++)
      {
        input += svit->first;
        output += svit->second;
      }
      oss << input << ":" << output << "\t" << it->first << std::endl;
    }
    return oss.str();
}

// *** Wrappers for lookup functions *** //

HfstOneLevelPaths lookup_vector(const hfst::HfstTransducer * tr, bool fd, const StringVector& s, int limit = -1, double time_cutoff = 0.0) throw(FunctionNotImplementedException)
{
  if (tr->get_type() == hfst::HFST_OL_TYPE || tr->get_type() == hfst::HFST_OLW_TYPE)
    {
      if (fd)
        { return *(tr->lookup_fd(s, limit, time_cutoff)); }
      else
        { return *(tr->lookup(s, limit, time_cutoff)); }
    }
  hfst::HfstTransducer input(s, tr->get_type());
  input.compose(*(tr));
  input.minimize();
  hfst::HfstTwoLevelPaths result;
  if (fd)
    { input.extract_paths_fd(result, limit, -1); }
  else
    { input.extract_paths(result, limit, -1); }
  return hfst::extract_output_side(result);
}

HfstOneLevelPaths lookup_string(const hfst::HfstTransducer * tr, bool fd, const std::string& s, int limit = -1, double time_cutoff = 0.0) throw(FunctionNotImplementedException)
{
  if (tr->get_type() == hfst::HFST_OL_TYPE || tr->get_type() == hfst::HFST_OLW_TYPE)
    {
      if (fd)
        { return *(tr->lookup_fd(s, limit, time_cutoff)); }
      else
        { return *(tr->lookup(s, limit, time_cutoff)); }
    }
  hfst::StringSet alpha = tr->get_alphabet();
  hfst::HfstTokenizer tok;
  for (hfst::StringSet::const_iterator it = alpha.begin(); it != alpha.end(); it++)
    { tok.add_multichar_symbol(*it); }
  hfst::HfstTransducer input(s, tok, tr->get_type());
  input.compose(*(tr));
  input.minimize();
  hfst::HfstTwoLevelPaths result;
  if (fd)
    { input.extract_paths_fd(result, limit, -1); }
  else
    { input.extract_paths(result, limit, -1); }
  return hfst::extract_output_side(result);
}

}
