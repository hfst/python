namespace hfst {
// *** Wrappers for rule functions. *** //

namespace hfst_rules {

  HfstTransducer two_level_if(const HfstTransducerPair & context, const StringPairSet & mappings, const StringPairSet & alphabet)
  {
    hfst::HfstTransducerPair context_(context);
    StringPairSet mappings_(mappings);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::two_level_if(context_, mappings_, alphabet_);
  }
  HfstTransducer two_level_only_if(const HfstTransducerPair &context, const StringPairSet &mappings, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPair context_(context);
    StringPairSet mappings_(mappings);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::two_level_only_if(context_, mappings_, alphabet_);
  }
  HfstTransducer two_level_if_and_only_if(const HfstTransducerPair &context, const StringPairSet &mappings, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPair context_(context);
    StringPairSet mappings_(mappings);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::two_level_if_and_only_if(context_, mappings_, alphabet_);
  }
  HfstTransducer replace_down(const HfstTransducerPair &context, const HfstTransducer &mapping, bool optional, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPair context_(context);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::replace_down(context_, mapping_, optional, alphabet_);
  }
  HfstTransducer replace_down_karttunen(const HfstTransducerPair &context, const HfstTransducer &mapping, bool optional, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPair context_(context);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::replace_down_karttunen(context_, mapping_, optional, alphabet_);
  }
  HfstTransducer replace_right(const HfstTransducerPair &context, const HfstTransducer &mapping, bool optional, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPair context_(context);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::replace_right(context_, mapping_, optional, alphabet_);
  }
  HfstTransducer replace_left(const HfstTransducerPair &context, const HfstTransducer &mapping, bool optional, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPair context_(context);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::replace_left(context_, mapping_, optional, alphabet_);
  }
  HfstTransducer replace_up(const HfstTransducer &mapping, bool optional, const StringPairSet &alphabet)
  {
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::replace_up(mapping_, optional, alphabet_);
  }
  HfstTransducer replace_down(const HfstTransducer &mapping, bool optional, const StringPairSet &alphabet)
  {
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::replace_down(mapping_, optional, alphabet_);
  }
  HfstTransducer left_replace_up(const HfstTransducer &mapping, bool optional, const StringPairSet &alphabet)
  {
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::left_replace_up(mapping_, optional, alphabet_);
  }
  HfstTransducer left_replace_up(const HfstTransducerPair &context, const HfstTransducer &mapping, bool optional, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPair context_(context);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::left_replace_up(context_, mapping_, optional, alphabet_);
  }
  HfstTransducer left_replace_down(const HfstTransducerPair &context, const HfstTransducer &mapping, bool optional, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPair context_(context);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::left_replace_down(context_, mapping_, optional, alphabet_);
  }
  HfstTransducer left_replace_down_karttunen(const HfstTransducerPair &context, const HfstTransducer &mapping, bool optional, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPair context_(context);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::left_replace_down_karttunen(context_, mapping_, optional, alphabet_);
  }
  HfstTransducer left_replace_left(const HfstTransducerPair &context, const HfstTransducer &mapping, bool optional, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPair context_(context);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::left_replace_left(context_, mapping_, optional, alphabet_);
  }
  HfstTransducer left_replace_right(const HfstTransducerPair &context, const HfstTransducer &mapping, bool optional, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPair context_(context);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::left_replace_right(context_, mapping_, optional, alphabet_);
  }
  HfstTransducer restriction(const HfstTransducerPairVector &contexts, const HfstTransducer &mapping, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPairVector contexts_(contexts);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::restriction(contexts_, mapping_, alphabet_);
  }
  HfstTransducer coercion(const HfstTransducerPairVector &contexts, const HfstTransducer &mapping, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPairVector contexts_(contexts);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::coercion(contexts_, mapping_, alphabet_);
  }
  HfstTransducer restriction_and_coercion(const HfstTransducerPairVector &contexts, const HfstTransducer &mapping, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPairVector contexts_(contexts);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::restriction_and_coercion(contexts_, mapping_, alphabet_);
  }
  HfstTransducer surface_restriction(const HfstTransducerPairVector &contexts, const HfstTransducer &mapping, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPairVector contexts_(contexts);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::surface_restriction(contexts_, mapping_, alphabet_);
  }
  HfstTransducer surface_coercion(const HfstTransducerPairVector &contexts, const HfstTransducer &mapping, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPairVector contexts_(contexts);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::surface_coercion(contexts_, mapping_, alphabet_);
  }
  HfstTransducer surface_restriction_and_coercion(const HfstTransducerPairVector &contexts, const HfstTransducer &mapping, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPairVector contexts_(contexts);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::surface_restriction_and_coercion(contexts_, mapping_, alphabet_);
  }
  HfstTransducer deep_restriction(const HfstTransducerPairVector &contexts, const HfstTransducer &mapping, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPairVector contexts_(contexts);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::deep_restriction(contexts_, mapping_, alphabet_);
  }
  HfstTransducer deep_coercion(const HfstTransducerPairVector &contexts, const HfstTransducer &mapping, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPairVector contexts_(contexts);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::deep_coercion(contexts_, mapping_, alphabet_);
  }
  HfstTransducer deep_restriction_and_coercion(const HfstTransducerPairVector &contexts, const HfstTransducer &mapping, const StringPairSet &alphabet)
  {
    hfst::HfstTransducerPairVector contexts_(contexts);
    hfst::HfstTransducer mapping_(mapping);
    StringPairSet alphabet_(alphabet);
    return hfst::rules::deep_restriction_and_coercion(contexts_, mapping_, alphabet_);
  }

}

}
