
// File: classhfst_1_1AttReader.xml


%feature("docstring") hfst::AttReader
"""

A class for reading input in AT&T text format and converting it into
transducer(s).

An example that reads AT&T input from file 'testfile.att' where epsilon is
represented as \"<eps>\" and creates the corresponding transducers and prints
them. If the input cannot be parsed, a message showing the invalid line in AT&T
input is printed and reading is stopped.

     with open('testfile.att', 'r') as f:
         try:
             r = hfst.AttReader(f, \"<eps>\")
             for tr in r:
                 print(tr)
         except hfst.exceptions.NotValidAttFormatException as e:
             print(e.what())
"""

%feature("docstring") hfst::AttReader::__init__
"""

Create an AttReader that reads input from file *f* where the epsilon is
represented as *epsilonstr*.

Parameters
----------
* `f` :
    A python file.
* `epsilonstr` :
    How epsilon is represented in the file. By default, \"@_EPSILON_SYMBOL_@\"
    and \"@0@\" are both recognized.
"""

%feature("docstring") hfst::AttReader::__next__
"""

Return next element (for python version 3).

Needed for 'for ... in' statement.

     for transducer in att_reader:
         print(transducer)

Exceptions
----------
* `StopIteration` :
"""

%feature("docstring") hfst::AttReader::read
"""

Read next transducer.

Read next transducer description in AT&T format and return a corresponding
transducer.

Exceptions
----------
* `hfst.exceptions.NotValidAttFormatException` :
* `hfst.exceptions.EndOfStreamException` :
"""

%feature("docstring") hfst::AttReader::__iter__
"""

An iterator to the reader.

Needed for 'for ... in' statement.

     for transducer in att_reader:
         print(transducer)
"""

%feature("docstring") hfst::AttReader::next
"""

Return next element (for python version 2).

Needed for 'for ... in' statement.

     for transducer in att_reader:
         print(transducer)

Exceptions
----------
* `StopIteration` :
"""


// File: classhfst_1_1HfstBasicTransducer.xml


%feature("docstring") hfst::HfstBasicTransducer
"""

A simple transducer class with tropical weights.

An example of creating an HfstBasicTransducer [foo:bar baz:baz] with weight 0.4
from scratch:

      # Create an empty transducer
      # The transducer has initially one start state (number zero)
      # that is not final
      fsm = hfst.HfstBasicTransducer()
      # Add two states to the transducer
      fsm.add_state(1)
      fsm.add_state(2)
      # Create a transition [foo:bar] leading to state 1 with weight 0.1
      tr = hfst.HfstBasicTransition(1, 'foo', 'bar', 0.1)
      # and add it to state zero
      fsm.add_transition(0, tr)
      # Add a transition [baz:baz] with weight 0 from state 1 to state 2
      fsm.add_transition(1, hfst.HfstBasicTransition(2, 'baz', 'baz', 0.0))
      # Set state 2 as final with weight 0.3
      fsm.set_final_weight(2, 0.3)

An example of iterating through the states and transitions of the above
transducer when printing them in AT&T format to standard output:

      # Go through all states
      for state, arcs in enumerate(fsm):
        for arc in arcs:
          print('%i ' % (state), end='')
          print(arc)
        if fsm.is_final_state(state):
          print('%i %f' % (state, fsm.get_final_weight(state)) )

See also: hfst.HfstBasicTransition
"""

%feature("docstring") hfst::HfstBasicTransducer::states_and_transitions
"""

The states and transitions of the transducer.

Returns
-------
A tuple of tuples of HfstBasicTransitions.

See also: hfst.HfstBasicTransducer.__enumerate__
"""

%feature("docstring") hfst::HfstBasicTransducer::get_final_weight
"""

Get the final weight of state *state* in this transducer.

Parameters
----------
* `state` :
    The number of the state. If it does not exist, a StateIsNotFinalException is
    thrown.

Exceptions
----------
* `hfst.exceptions.StateIsNotFinalException.` :
"""

%feature("docstring") hfst::HfstBasicTransducer::__init__
"""

Create a transducer with one initial state that has state number zero and is not
a final state, i.e.

create an empty transducer.

     tr = hfst.HfstBasicTransducer()
"""

%feature("docstring") hfst::HfstBasicTransducer::__init__
"""

Create a transducer equivalent to *transducer*.

Parameters
----------
* `transducer` :
    The transducer to be copied, hfst.HfstBasicTransducer or
    hfst.HfstTransducer.

     tr = hfst.regex('foo') # creates an HfstTransducer
     TR = hfst.HfstBasicTransducer(tr)
     TR2 = hfst.HfstBasicTransducer(TR)
"""

%feature("docstring") hfst::HfstBasicTransducer::symbols_used
"""

Get a list of all symbols used in the transitions of this transducer.
"""

%feature("docstring") hfst::HfstBasicTransducer::remove_symbol_from_alphabet
"""

Remove symbol *symbol* from the alphabet of the graph.

note: Use with care, removing symbols that occur in the transitions of the graph
    can have unexpected results.

Parameters
----------
* `symbol` :
    The string to be removed.
"""

%feature("docstring") hfst::HfstBasicTransducer::get_transition_pairs
"""

Get a list of all input/output symbol pairs used in the transitions of this
transducer.
"""

%feature("docstring") hfst::HfstBasicTransducer::is_infinitely_ambiguous
"""

Whether the transducer is infinitely ambiguous.

A transducer is infinitely ambiguous if there exists an input that will yield
infinitely many results, i.e. there are input epsilon loops that are traversed
with that input.
"""

%feature("docstring") hfst::HfstBasicTransducer::harmonize
"""

Harmonize this transducer and *another*.

In harmonization the unknown and identity symbols in transitions of both graphs
are expanded according to the symbols that are previously unknown to the graph.

For example the graphs

     [a:b ?:?]
     [c:d ? ?:c] are expanded to

     [ a:b [?:? | ?:c | ?:d | c:d | d:c | c:? | d:?] ]
     [ c:d [? | a | b] [?:c| a:c | b:?] ] when harmonized.

The symbol '?' means hfst.UNKNOWN in either or both sides of a transition
(transitions of type [?:x], [x:?] and [?:?]). The transition [?] means
hfst.IDENTITY.

note: This function is always called for all transducer arguments of functions
    that take two or more graphs as their arguments, unless otherwise said.
"""

%feature("docstring") hfst::HfstBasicTransducer::sort_arcs
"""

Sort the arcs of this transducer according to input and output symbols.

Returns
-------
This transducer.
"""

%feature("docstring") hfst::HfstBasicTransducer::states
"""

The states of the transducer.

Returns
-------
A tuple of state numbers.

An example: /verbatim for state in fsm.states(): for arc in
fsm.transitions(state): print('i ' % (state), end='') print(arc) if
fsm.is_final_state(state): print('i f' % (state, fsm.get_final_weight(state)) )
/endverbatim
"""

%feature("docstring") hfst::HfstBasicTransducer::get_max_state
"""

Get the biggest state number in use.

Returns
-------
The biggest state number in use.
"""

%feature("docstring") hfst::HfstBasicTransducer::add_state
"""

Add a new state to this transducer and return its number.

Returns
-------
The next (smallest) free state number.
"""

%feature("docstring") hfst::HfstBasicTransducer::add_state
"""

Add a state *s* to this graph.

Parameters
----------
* `state` :
    The number of the state to be added.

Returns
-------
*state*

If the state already exists, it is not added again. All states with state number
smaller than *s* are also added to the transducer if they did not exist before.
"""

%feature("docstring") hfst::HfstBasicTransducer::write_att
"""

Write this transducer in AT&T format to file *f*, *write_weights* defines
whether weights are written.
"""

%feature("docstring") hfst::HfstBasicTransducer::remove_symbols_from_alphabet
"""

Remove symbols *symbols* from the alphabet of the graph.

note: Use with care, removing symbols that occur in the transitions of the graph
    can have unexpected results.

Parameters
----------
* `symbols` :
    A tuple of strings to be removed.
"""

%feature("docstring") hfst::HfstBasicTransducer::__enumerate__
"""

Return an enumeration of the states and transitions of the transducer.

     for state, arcs in enumerate(fsm):
       for arc in arcs:
         print('%i ' % (state), end='')
         print(arc)
       if fsm.is_final_state(state):
         print('%i %f' % (state, fsm.get_final_weight(state)) )
"""

%feature("docstring") hfst::HfstBasicTransducer::longest_path_size
"""

The length of the longest path in transducer.

Length of a path means number of arcs on that path.
"""

%feature("docstring") hfst::HfstBasicTransducer::get_alphabet
"""

The symbols in the alphabet of the transducer.

The symbols do not necessarily occur in any transitions of the transducer.
Epsilon, unknown and identity symbols are always included in the alphabet.

Returns
-------
A tuple of strings.
"""

%feature("docstring") hfst::HfstBasicTransducer::substitute
"""

Substitute symbols or transitions in the transducer.

Parameters
----------
* `s` :
    The symbol or transition to be substituted. Can also be a dictionary of
    substitutions, if S == None.
* `S` :
    The symbol, transition, a tuple of transitions or a transducer
    (hfst.HfstBasicTransducer) that substitutes *s*.
* `kvargs` :
    Arguments recognized are 'input' and 'output', their values can be False or
    True, True being the default. These arguments are valid only if *s* and *S*
    are strings, else they are ignored.
* `input` :
    Whether substitution is performed on input side, defaults to True. Valid
    only if *s* and *S* are strings.
* `output` :
    Whether substitution is performed on output side, defaults to True. Valid
    only if *s* and *S* are strings.

Possible combinations of arguments and their types are:

(1) substitute(str, str, input=bool, output=bool): substitute symbol with symbol
on input, output or both sides of each transition in the transducer. (2)
substitute(strpair, strpair): substitute transition with transition (3)
substitute(strpair, strpairtuple): substitute transition with several
transitions (4) substitute(strpair, transducer): substitute transition with a
transducer (5) substitute(dict): perform several symbol-to-symbol substitutions
(6) substitute(dict): perform several transition-to-transition substitutions

Examples:

(1) tr.substitute('a', 'A', input=True, output=False): substitute lowercase a:s
with uppercase ones (2) tr.substitute(('a','b'),('A','B')): substitute
transitions that map lowercase a into lowercase b with transitions that map
uppercase a into uppercase b (3) tr.substitute(('a','b'),
(('A','B'),('a','B'),('A','b'))): change either or both sides of a transition
[a:b] to uppercase (4) tr.substitute(('a','b'), hfst.regex('[a:b]+')) change
[a:b] transition into one or more consecutive [a:b] transitions (5)
tr.substitute({'a':'A', 'b':'B', 'c':'C'}) change lowercase a, b and c into
their uppercase variants (6) tr.substitute( {('a','a'):('A','A'),
('b','b'):('B','B'), ('c','c'):('C','C')} ): change lowercase a, b and c into
their uppercase variants

In case (4), epsilon transitions are used to attach copies of transducer *S*
between the SOURCE and TARGET state of each transition that is substituted. The
transition itself is deleted, but its weight is copied to the epsilon transition
leading from SOURCE to the initial state of *S*. Each final state of *S* is made
non-final and an epsilon transition leading to TARGET is attached to it. The
final weight is copied to the epsilon transition.
"""

%feature("docstring") hfst::HfstBasicTransducer::remove_transition
"""

Remove transition *transition* from state *s*.

Parameters
----------
* `s` :
    The state which *transition* belongs to.
* `transition` :
    The transition to be removed.
* `remove_symbols_from_alphabet` :
    (?)
"""

%feature("docstring") hfst::HfstBasicTransducer::add_transition
"""

Add a transition *transition* to state *state*, *add_symbols_to_alphabet*
defines whether the transition symbols are added to the alphabet.

Parameters
----------
* `state` :
    The number of the state where the transition is added. If it does not exist,
    it is created.
* `transition` :
    A hfst.HfstBasicTransition that is added to *state*.
* `add_symbols_to_alphabet` :
    Whether the transition symbols are added to the alphabet of the transducer.
    (In special cases this is not wanted.)
"""

%feature("docstring") hfst::HfstBasicTransducer::add_transition
"""

Add a transition from state *source* to state *target* with input symbol
*input*, output symbol *output* and weight *weight*.

Parameters
----------
* `source` :
    The number of the state where the transition is added. If it does not exist,
    it is created.
* `target` :
    The number of the state where the transition leads. If it does not exist, it
    is created. (?)
* `input` :
    The input symbol of the transition.
* `output` :
    The output symbol of the transition.
* `weight` :
    The weight of the transition.
"""

%feature("docstring") hfst::HfstBasicTransducer::read_prolog
"""

Read a transducer from prolog file *f*.

*linecount* is incremented as lines are read (is it in python?).

Returns
-------
A transducer constructed by reading from file *file*. This function is a static
one.
"""

%feature("docstring") hfst::HfstBasicTransducer::lookup_fd
"""

Lookup tokenized input *input* in the transducer minding flag diacritics.

Parameters
----------
* `str` :
    A list/tuple of strings to look up.
* `kvargs` :
    infinite_cutoff=-1, max_weight=None
* `infinite_cutoff` :
    Defaults to -1, i.e. infinite.
* `max_weight` :
    Defaults to None, i.e. infinity.
"""

%feature("docstring") hfst::HfstBasicTransducer::prune_alphabet
"""

Remove all symbols that do not occur in transitions of the transducer from its
alphabet.

Epsilon, unknown and identity symbols are always included in the alphabet.
"""

%feature("docstring") hfst::HfstBasicTransducer::write_prolog
"""

Write the transducer in prolog format to file *f*.

Name the transducer *name*.
"""

%feature("docstring") hfst::HfstBasicTransducer::disjunct
"""

Disjunct this transducer with a one-path transducer defined by consecutive
string pairs in *spv* that has weight *weight*.

pre: This graph must be a trie where all weights are in final states, i.e. all
    transitions have a zero weight.

There is no way to test whether a graph is a trie, so the use of this function
is probably limited to fast construction of a lexicon. Here is an example:

     lexicon = hfst.HfstBasicTransducer()
     tok = hfst.HfstTokenizer()
     lexicon.disjunct(tok.tokenize('dog'), 0.3)
     lexicon.disjunct(tok.tokenize('cat'), 0.5)
     lexicon.disjunct(tok.tokenize('elephant'), 1.6)
"""

%feature("docstring") hfst::HfstBasicTransducer::read_att
"""

Read a transducer in AT&T format from file *f*.

*epsilon_symbol* defines the symbol used for epsilon, *linecount* is incremented
as lines are read.

Returns
-------
A transducer constructed by reading from file *file*. This function is a static
one.
"""

%feature("docstring") hfst::HfstBasicTransducer::add_symbol_to_alphabet
"""

Explicitly add *symbol* to the alphabet of the graph.

note: Usually the user does not have to take care of the alphabet of a graph.
    This function can be useful in some special cases. @ param symbol The string
    to be added.
"""

%feature("docstring") hfst::HfstBasicTransducer::__str__
"""

Return a string representation of the transducer.

     print(fsm)
"""

%feature("docstring") hfst::HfstBasicTransducer::set_final_weight
"""

Set the final weight of state *state* in this transducer to *weight*.

If the state does not exist, it is created.
"""

%feature("docstring") hfst::HfstBasicTransducer::add_symbols_to_alphabet
"""

Explicitly add *symbols* to the alphabet of the graph.

note: Usually the user does not have to take care of the alphabet of a graph.
    This function can be useful in some special cases.

Parameters
----------
* `symbols` :
    A tuple of strings to be added.
"""

%feature("docstring") hfst::HfstBasicTransducer::transitions
"""

Get the transitions of state *state* in this transducer.

If the state does not exist, a *StateIndexOutOfBoundsException* is thrown.

Returns
-------
A tuple of HfstBasicTransitions.

     for state in fsm.states():
     for arc in fsm.transitions(state):
         print('%i ' % (state), end='')
         print(arc)
     if fsm.is_final_state(state):
        print('%i %f' % (state, fsm.get_final_weight(state)) )
"""

%feature("docstring") hfst::HfstBasicTransducer::insert_freely
"""

Insert freely any number of *symbol_pair* in the transducer with weight
*weight*.

Parameters
----------
* `symbol_pair` :
    A string pair to be inserted.
* `weight` :
    The weight of the inserted symbol pair.
"""

%feature("docstring") hfst::HfstBasicTransducer::insert_freely
"""

Insert freely any number of *transducer* in this transducer.

param transducer An HfstBasicTransducer to be inserted.
"""

%feature("docstring") hfst::HfstBasicTransducer::write_xfst
"""

Write the transducer in xfst format to file *f*.
"""

%feature("docstring") hfst::HfstBasicTransducer::is_final_state
"""

Whether state *state* is final.

Parameters
----------
* `state` :
    The state whose finality is returned.
"""

%feature("docstring") hfst::HfstBasicTransducer::is_lookup_infinitely_ambiguous
"""

Whether the transducer is infinitely ambiguous with input *str*.

Parameters
----------
* `str` :
    The input.

A transducer is infinitely ambiguous with a given input if the input yields
infinitely many results, i.e. there are input epsilon loops that are traversed
with the input.
"""


// File: classhfst_1_1HfstBasicTransition.xml


%feature("docstring") hfst::HfstBasicTransition
"""

A transition class that consists of a target state, input and output symbols and
a a tropical weight.

See also: hfst.HfstBasicTransducer
"""

%feature("docstring") hfst::HfstBasicTransition::get_input_symbol
"""

Get the input symbol of the transition.
"""

%feature("docstring") hfst::HfstBasicTransition::get_weight
"""

Get the weight of the transition.
"""

%feature("docstring") hfst::HfstBasicTransition::get_output_symbol
"""

Get the output symbol of the transition.
"""

%feature("docstring") hfst::HfstBasicTransition::get_target_state
"""

Get number of the target state of the transition.
"""

%feature("docstring") hfst::HfstBasicTransition::__init__
"""

Create an HfstBasicTransition leading to target state *state* with input symbol
*input*, output symbol *output* and weight *weight*.

Parameters
----------
* `state` :
    Number of the target state.
* `input` :
    The input string.
* `output` :
    The output string.
* `weight` :
    The weight.

Exceptions
----------
* `EmptyStringException` :
         transition = hfst.HfstBasicTransition(1, 'foo', 'bar', 0.5)
"""


// File: classhfst_1_1HfstInputStream.xml


%feature("docstring") hfst::HfstInputStream
"""

A stream for reading HFST binary transducers.

An example:

     istr = hfst.HfstInputStream('testfile1.hfst')
     transducers = []
     while not (istr.is_eof()):
         transducers.append(istr.read())
     istr.close()
     print(\"Read %i transducers in total.\" % len(transducers))

For documentation on the HFST binary transducer format, see here.
"""

%feature("docstring") hfst::HfstInputStream::is_bad
"""

Whether badbit is set.
"""

%feature("docstring") hfst::HfstInputStream::is_eof
"""

Whether the stream is at end.
"""

%feature("docstring") hfst::HfstInputStream::__init__
"""

Create a stream for reading binary transducers.

Parameters
----------
* `filename` :
    The name of the transducer file. If not given, standard input is used.

Exceptions
----------
* `StreamNotReadableException` :
* `NotTransducerStreamException` :
* `EndOfStreamException` :
* `TransducerHeaderException` :
         istr_to_stdin = hfst.HfstInputStream()
         istr_to_file = hfst.HfstInputStream(filename='transducer.hfst')
"""

%feature("docstring") hfst::HfstInputStream::read
"""

Return next transducer.

Exceptions
----------
* `EndOfStreamException` :
"""

%feature("docstring") hfst::HfstInputStream::close
"""

Close the stream.

If the stream points to standard input, nothing is done.
"""

%feature("docstring") hfst::HfstInputStream::get_type
"""

The type of the first transducer in the stream.

By default, all transducers in a stream have the same type, else a
TransducerTypeMismatchException is thrown when reading the first transducer that
has a different type than the previous ones.
"""

%feature("docstring") hfst::HfstInputStream::is_good
"""

Whether the state of the stream is good for input operations.
"""


// File: classhfst_1_1HfstOutputStream.xml


%feature("docstring") hfst::HfstOutputStream
"""

A stream for writing binary transducers.

An example:

     res = ['foo:bar','0','0 - 0','\"?\":?','a* b+']
     ostr = hfst.HfstOutputStream(filename='testfile1.hfst')
     for re in res:
         ostr.write(hfst.regex(re))
         ostr.flush()
     ostr.close()

For more information on HFST transducer structure, see this page.
"""

%feature("docstring") hfst::HfstOutputStream::close
"""

Close the stream.

If the stream points to standard output, nothing is done.
"""

%feature("docstring") hfst::HfstOutputStream::__init__
"""

Open a stream for writing binary transducers.

Parameters
----------
* `kvargs` :
    Arguments recognized are filename, hfst_format, type.
* `filename` :
    The name of the file where transducers are written. If the file exists, it
    is overwritten. If *filename* is not given, transducers are written to
    standard output.
* `hfst_format` :
    Whether transducers are written in hfst format (default is True) or as such
    in their backend format.
* `type` :
    The type of the transducers that will be written to the stream. Default is
    hfst.get_default_fst_type().

     ostr = hfst.HfstOutputStream()  # a stream for writing default type
transducers in hfst format to standard output
     transducer = hfst.regex('foo:bar::0.5')
     ostr.write(transducer)
     ostr.flush()

     ostr = hfst.HfstOutputStream(filename='transducer.sfst', hfst_format=False,
type=hfst.types.SFST_TYPE)  # a stream for writing SFST_TYPE transducers in
their back-end format to a file
     transducer1 = hfst.regex('foo:bar')
     transducer1.convert(hfst.types.SFST_TYPE)  # if not set as the default type
     transducer2 = hfst.regex('bar:baz')
     transducer2.convert(hfst.types.SFST_TYPE)  # if not set as the default type
     ostr.write(transducer1)
     ostr.write(transducer2)
     ostr.flush()
     ostr.close()
"""

%feature("docstring") hfst::HfstOutputStream::flush
"""

Flush the stream.
"""

%feature("docstring") hfst::HfstOutputStream::write
"""

Write the transducer *transducer* in binary format to the stream.

All transducers must have the same type as the stream, else a
TransducerTypeMismatchException is thrown.

Exceptions
----------
* `hfst.exceptions.TransducerTypeMismatchException` :
"""


// File: classhfst_1_1HfstTransducer.xml


%feature("docstring") hfst::HfstTransducer
"""

A synchronous finite-state transducer.

"""

%feature("docstring") hfst::HfstTransducer::get_type
"""

The implementation type of the transducer.

Returns
-------
hfst.ImplementationType
"""

%feature("docstring") hfst::HfstTransducer::get_name
"""

Get the name of the transducer.

See also: set_name
"""

%feature("docstring") hfst::HfstTransducer::repeat_plus
"""

A concatenation of N transducers where N is any number from one to infinity.
"""

%feature("docstring") hfst::HfstTransducer::output_project
"""

Extract the output language of the transducer.

All transition symbol pairs *isymbol:osymbol* are changed to *osymbol:osymbol*.
"""

%feature("docstring") hfst::HfstTransducer::number_of_states
"""

The number of states in the transducer.
"""

%feature("docstring") hfst::HfstTransducer::minus
"""

Alias for subtract.

See also: hfst.HfstTransducer.subtract
"""

%feature("docstring") hfst::HfstTransducer::is_infinitely_ambiguous
"""

Whether the transducer is infinitely ambiguous.

A transducer is infinitely ambiguous if there exists an input that will yield
infinitely many results, i.e. there are input epsilon loops that are traversed
with that input.
"""

%feature("docstring") hfst::HfstTransducer::eliminate_flags
"""

Eliminate flag diacritics listed in *symbols* from the transducer.

Parameters
----------
* `symbols` :
    The flags to be eliminated. TODO: explain more.

An equivalent transducer with no flags listed in *symbols*.
"""

%feature("docstring") hfst::HfstTransducer::longest_path_size
"""

Get length of longest path of the transducer.
"""

%feature("docstring") hfst::HfstTransducer::get_properties
"""

Get all properties from the transducer.

Returns
-------
A dictionary whose keys are properties and whose values are the values of those
properties.
"""

%feature("docstring") hfst::HfstTransducer::optionalize
"""

Disjunct the transducer with an epsilon transducer.
"""

%feature("docstring") hfst::HfstTransducer::intersect
"""

Intersect this transducer with *another*.
"""

%feature("docstring") hfst::HfstTransducer::repeat_n_plus
"""

A concatenation of N transducers where N is any number from *n* to infinity,
inclusive.
"""

%feature("docstring") hfst::HfstTransducer::compare
"""

Whether this transducer and *another* are equivalent.

Parameters
----------
* `another` :
    The compared transducer.

pre: *self* and *another* must have the same implementation type.

Two transducers are equivalent iff they accept the same input/output string
pairs with the same weights and the same alignments.

note: For weighted transducers, the function often returns false negatives due
    to weight precision issues.
"""

%feature("docstring") hfst::HfstTransducer::remove_from_alphabet
"""

Remove *symbol* from the alphabet of the transducer.

Parameters
----------
* `symbol` :
    The symbol (string) to be removed.

pre: *symbol* does not occur in any transition of the transducer.

note: Use with care, removing a symbol that occurs in a transition of the
    transducer can have unexpected results.
"""

%feature("docstring") hfst::HfstTransducer::substitute
"""

Substitute symbols or transitions in the transducer.

Parameters
----------
* `s` :
    The symbol or transition to be substituted. Can also be a dictionary of
    substitutions, if S == None.
* `S` :
    The symbol, transition, a tuple of transitions or a transducer
    (hfst.HfstTransducer) that substitutes *s*.
* `kvargs` :
    Arguments recognized are 'input' and 'output', their values can be False or
    True, True being the default. These arguments are valid only if *s* and *S*
    are strings, else they are ignored.
* `input` :
    Whether substitution is performed on input side, defaults to True. Valid
    only if *s* and *S* are strings.
* `output` :
    Whether substitution is performed on output side, defaults to True. Valid
    only if *s* and \\ S are strings.

For more information, see hfst.HfstBasicTransducer.substitute. The function
works similarly, with the exception of argument *S*, which must be
hfst.HfstTransducer instead of hfst.HfstBasicTransducer.

See also: hfst.HfstBasicTransducer.substitute
"""

%feature("docstring") hfst::HfstTransducer::compose
"""

Compose this transducer with *another*.

Parameters
----------
* `another` :
    The second argument in the composition. Not modified.
"""

%feature("docstring") hfst::HfstTransducer::write_prolog
"""

Write the transducer in prolog format with name *name* to file *f*,
*write_weights* defined whether weights are written.

Parameters
----------
* `f` :
    A python file where the transducer is written.
* `name` :
    The name of the transducer that must be given in a prolog file.
* `write_weights` :
    Whether weights are written.
"""

%feature("docstring") hfst::HfstTransducer::repeat_n_to_k
"""

A concatenation of N transducers where N is any number from *n* to *k*,
inclusive.
"""

%feature("docstring") hfst::HfstTransducer::conjunct
"""

Alias for intersect.

See also: hfst.HfstTransducer.intersect
"""

%feature("docstring") hfst::HfstTransducer::repeat_n_minus
"""

A concatenation of N transducers where N is any number from zero to *n*,
inclusive.
"""

%feature("docstring") hfst::HfstTransducer::disjunct
"""

Disjunct this transducer with *another*.
"""

%feature("docstring") hfst::HfstTransducer::lookup_optimize
"""

Optimize the transducer for lookup.

This effectively converts the transducer into hfst.types.HFST_OL_TYPE.
"""

%feature("docstring") hfst::HfstTransducer::extract_longest_paths
"""

Extract longest paths of the transducer.

Returns
-------
A dictionary.
"""

%feature("docstring") hfst::HfstTransducer::n_best
"""

Extract *n* best paths of the transducer.

In the case of a weighted transducer (hfst.types.TROPICAL_OPENFST_TYPE or
hfst.types.LOG_OPENFST_TYPE), best paths are defined as paths with the lowest
weight. In the case of an unweighted transducer (hfst.types.SFST_TYPE or
hfst.types.FOMA_TYPE), the function returns random paths.

This function is not implemented for hfst.types.FOMA_TYPE or
hfst.types.SFST_TYPE. If this function is called by an HfstTransducer of type
hfst.types.FOMA_TYPE or hfst.types.SFST_TYPE, it is converted to
hfst.types.TROPICAL_OPENFST_TYPE, paths are extracted and it is converted back
to hfst.types.FOMA_TYPE or hfst.types.SFST_TYPE. If HFST is not linked to
OpenFst library, an hfst.exceptions.ImplementationTypeNotAvailableException is
thrown.
"""

%feature("docstring") hfst::HfstTransducer::is_implementation_type_available
"""

Whether HFST is linked to the transducer library needed by implementation type
*type*.
"""

%feature("docstring") hfst::HfstTransducer::invert
"""

Swap the input and output symbols of each transition in the transducer.
"""

%feature("docstring") hfst::HfstTransducer::extract_paths
"""

Extract paths that are recognized by the transducer.

Parameters
----------
* `kvargs` :
    Arguments recognized are filter_flags, max_cycles, max_number, obey_flags,
    output, random.
* `filter_flags` :
    Whether flags diacritics are filtered out from the result (default True).
* `max_cycles` :
    Indicates how many times a cycle will be followed, with negative numbers
    indicating unlimited (default -1 i.e. unlimited).
* `max_number` :
    The total number of resulting strings is capped at this value, with 0 or
    negative indicating unlimited (default -1 i.e. unlimited).
* `obey_flags` :
    Whether flag diacritics are validated (default True).
* `output` :
    Output format. Values recognized: 'text' (as a string, separated by
    newlines), 'raw' (a dictionary that maps each input string into a list of
    tuples of an output string and a weight), 'dict' (a dictionary that maps
    each input string into a tuple of tuples of an output string and a weight,
    the default).
* `random` :
    Whether result strings are fetched randomly (default False).

Returns
-------
The extracted strings. *output* controls how they are represented.

pre: The transducer must be acyclic, if both *max_number* and *max_cycles* have
    unlimited values. Else a hfst.exceptions.TransducerIsCyclicException will be
    thrown.

An example:

     >>> tr = hfst.regex('a:b+ (a:c+)')
     >>> print(tr)
     0       1       a       b       0.000000
     1       1       a       b       0.000000
     1       2       a       c       0.000000
     1       0.000000
     2       2       a       c       0.000000
     2       0.000000

     >>> print(tr.extract_paths(max_cycles=1, output='text'))
     a:b     0
     aa:bb   0
     aaa:bbc 0
     aaaa:bbcc       0
     aa:bc   0
     aaa:bcc 0

     >>> print(tr.extract_paths(max_number=4, output='text'))
     a:b     0
     aa:bc   0
     aaa:bcc 0
     aaaa:bccc       0

     >>> print(tr.extract_paths(max_cycles=1, max_number=4, output='text'))
     a:b     0
     aa:bb   0
     aa:bc   0
     aaa:bcc 0

Exceptions
----------
* `TransducerIsCyclicException` :

See also: hfst.HfstTransducer.n_best

note: Special symbols are printed as such.
Todo
a link to flag diacritics
"""

%feature("docstring") hfst::HfstTransducer::__str__
"""

An AT&T representation of the transducer.

Defined for print command. An example:

     >>> print(hfst.regex('[foo:bar::2]+'))
     0       1       foo     bar     2.000000
     1       1       foo     bar     2.000000
     1       0.000000 Todo
Works only for small transducers.
"""

%feature("docstring") hfst::HfstTransducer::is_cyclic
"""

Whether the transducer is cyclic.
"""

%feature("docstring") hfst::HfstTransducer::has_flag_diacritics
"""

Whether the transducer has flag diacritics in its transitions.
"""

%feature("docstring") hfst::HfstTransducer::eliminate_flag
"""

Eliminate flag diacritic *symbol* from the transducer.

Parameters
----------
* `symbol` :
    The flag to be eliminated. TODO: explain more.

An equivalent transducer with no flags *symbol*.
"""

%feature("docstring") hfst::HfstTransducer::is_lookup_infinitely_ambiguous
"""

Whether lookup of path *input* will have infinite results.

Currently, this function will return whether the transducer is infinitely
ambiguous on any lookup path found in the transducer, i.e. the argument *input*
is ignored.

Todo
Do not ignore the argument *input*
"""

%feature("docstring") hfst::HfstTransducer::set_name
"""

Rename the transducer *name*.

Parameters
----------
* `name` :
    The name of the transducer.

See also: get_name
"""

%feature("docstring") hfst::HfstTransducer::priority_union
"""

Make priority union of this transducer with *another*.

For the operation t1.priority_union(t2), the result is a union of t1 and t2,
except that whenever t1 and t2 have the same string on left side, the path in t2
overrides the path in t1.

Example

     Transducer 1 (t1):
     a : a
     b : b

     Transducer 2 (t2):
     b : B
     c : C

     Result ( t1.priority_union(t2) ):
     a : a
     b : B
     c : C For more information, read fsmbook.
"""

%feature("docstring") hfst::HfstTransducer::insert_freely
"""

Freely insert a transition or a transducer into the transducer.

Parameters
----------
* `ins` :
    The transition or transducer to be inserted.

If *ins* is a transition, i.e. a 2-tuple of strings: A transition is added to
each state in this transducer. The transition leads from that state to itself
with input and output symbols defined by *ins*. The weight of the transition is
zero.

If *ins* is an hfst.HfstTransducer: A copy of *ins* is attached with epsilon
transitions to each state of this transducer. After the operation, for each
state S in this transducer, there is an epsilon transition that leads from state
S to the initial state of *ins*, and for each final state of *ins*, there is an
epsilon transition that leads from that final state to state S in this
transducer. The weights of the final states in *ins* are copied to the epsilon
transitions leading to state S.
"""

%feature("docstring") hfst::HfstTransducer::input_project
"""

Extract the input language of the transducer.

All transition symbol pairs *isymbol:osymbol* are changed to *isymbol:isymbol*.
"""

%feature("docstring") hfst::HfstTransducer::reverse
"""

Reverse the transducer.

A reverted transducer accepts the string 'n(0) n(1) ... n(N)' iff the original
transducer accepts the string 'n(N) n(N-1) ... n(0)'
"""

%feature("docstring") hfst::HfstTransducer::compose_intersect
"""

Compose this transducer with the intersection of transducers in *v*.

If *invert* is true, then compose the intersection of the transducers in *v*
with this transducer.

The algorithm used by this function is faster than intersecting all transducers
one by one and then composing this transducer with the intersection.

pre: The transducers in *v* are deterministic and epsilon-free.

Parameters
----------
* `v` :
    A tuple of transducers.
* `invert` :
    Whether the intersection of the transducers in *v* is composed with this
    transducer.
"""

%feature("docstring") hfst::HfstTransducer::copy
"""

Return a deep copy of the transducer.

     tr = hfst.regex('[foo:bar::0.3]*')
     TR = tr.copy()
     assert(tr.compare(TR))
"""

%feature("docstring") hfst::HfstTransducer::shuffle
"""

Shuffle this transducer with transducer *another*.

If transducer A accepts string 'foo' and transducer B string 'bar', the
transducer that results from shuffling A and B accepts all strings
[(f|b)(o|a)(o|r)].

pre: Both transducers must be automata, i.e. map strings onto themselves.
"""

%feature("docstring") hfst::HfstTransducer::prune
"""

Make transducer coaccessible.

A transducer is coaccessible iff there is a path from every state to a final
state.
"""

%feature("docstring") hfst::HfstTransducer::extract_shortest_paths
"""

Extract shortest paths of the transducer.

Returns
-------
A dictionary.
"""

%feature("docstring") hfst::HfstTransducer::set_final_weights
"""

Set the weights of all final states to *weight*.

If the HfstTransducer is of unweighted type (hfst.types.SFST_TYPE or
hfst.types.FOMA_TYPE), nothing is done.
"""

%feature("docstring") hfst::HfstTransducer::push_weights_to_end
"""

Push weights towards final state(s).

If the HfstTransducer is of unweighted type (hfst.types.SFST_TYPE or
hfst.types.FOMA_TYPE), nothing is done.

An example:

     >>> import hfst
     >>> tr = hfst.regex('[a::1 a:b::0.3 (b::0)]::0.7;')
     >>> tr.push_weights_to_end()
     >>> print(tr)
     0       1       a       a       0.000000
     1       2       a       b       0.000000
     2       3       b       b       0.000000
     2       2.000000
     3       2.000000

See also: hfst.HfstTransducer.push_weights_to_start
"""

%feature("docstring") hfst::HfstTransducer::push_weights_to_start
"""

Push weights towards initial state.

If the HfstTransducer is of unweighted type (hfst.types.SFST_TYPE or
hfst.types.FOMA_TYPE), nothing is done.

An example:

     >>> import hfst
     >>> tr = hfst.regex('[a::1 a:b::0.3 (b::0)]::0.7;')
     >>> tr.push_weights_to_start()
     >>> print(tr)
     0       1       a       a       2.000000
     1       2       a       b       0.000000
     2       3       b       b       0.000000
     2       0.000000
     3       0.000000

See also: hfst.HfstTransducer.push_weights_to_end
"""

%feature("docstring") hfst::HfstTransducer::subtract
"""

Subtract transducer *another* from this transducer.
"""

%feature("docstring") hfst::HfstTransducer::repeat_star
"""

A concatenation of N transducers where N is any number from zero to infinity.
"""

%feature("docstring") hfst::HfstTransducer::write_att
"""

Write the transducer in AT&T format to file *f*, *write_weights* defined whether
weights are written.

Parameters
----------
* `f` :
    A python file where transducer is written.
* `write_weights` :
    Whether weights are written.
"""

%feature("docstring") hfst::HfstTransducer::write_att
"""

Write the transducer in AT&T format to file *ofile*, *write_weights* defines
whether weights are written.

The fields in the resulting AT&T format are separated by tabulator characters.

NOTE: If the transition symbols contain space characters,the spaces are printed
as '@_SPACE_@' because whitespace characters are used as field separators in
AT&T format. Epsilon symbols are printed as '@0@'.

If several transducers are written in the same file, they must be separated by a
line of two consecutive hyphens \"--\", so that they will be read correctly by
hfst.read_att.

An example:

     tr1 = hfst.regex('[foo:bar baz:0 \" \"]::0.3')
     tr2 = hfst.empty_fst()
     tr3 = hfst.epsilon_fst(0.5)
     tr4 = hfst.regex('[foo]')
     tr5 = hfst.empty_fst()

     f = hfst.hfst_open('testfile.att', 'w')
     for tr in [tr1, tr2, tr3, tr4]:
         tr.write_att(f)
         f.write('--\\n')
     tr5.write_att(f)
     f.close()

This will yield a file 'testfile.att' that looks as follows:

     0       1       foo     bar     0.299805
     1       2       baz     @0@     0.000000
     2       3       @_SPACE_@       @_SPACE_@       0.000000
     3       0.000000
     --
     --
     0       0.500000
     --
     0       1       foo     foo     0.000000
     1       0.000000
     --

Exceptions
----------
* `StreamCannotBeWrittenException` :
* `StreamIsClosedException` :

See also: hfst.HfstOutputStream.write

See also: hfst.HfstTransducer.__init__
"""

%feature("docstring") hfst::HfstTransducer::write_att
"""

Write the transducer in AT&T format to file named *filename*.

*write_weights* defines whether weights are written.

If the file exists, it is overwritten. If the file does not exist, it is
created.
"""

%feature("docstring") hfst::HfstTransducer::lookup
"""

Lookup string *input*.

Parameters
----------
* `input` :
    The input.
* `kvargs` :
    Possible parameters and their default values are: obey_flags=True,
    max_number=-1, time_cutoff=0.0, output='tuple'
* `obey_flags` :
    Whether flag diacritics are obeyed. Currently always True.
* `max_number` :
    Maximum number of results returned, defaults to -1, i.e. infinity.
* `time_cutoff` :
    How long the function can search for results before returning, expressed in
    seconds. Defaults to 0.0, i.e. infinitely.
* `output` :
    Possible values are 'tuple', 'text' and 'raw', 'tuple' being the default.

note: This function is implemented only for optimized lookup format
    (hfst.types.HFST_OL_TYPE or hfst.types.HFST_OLW_TYPE). Either convert to
    optimized lookup format or to HfstBasicTransducer if you wish to perform
    lookup. Conversion to OL might take a while but it lookup is fast.
    Conversion to HfstBasicTransducer is quick but lookup is slower.
"""

%feature("docstring") hfst::HfstTransducer::__init__
"""

Create an empty transducer.

     tr = hfst.HfstTransducer()
     assert(tr.compare(hfst.empty_fst()))
"""

%feature("docstring") hfst::HfstTransducer::__init__
"""

Create a deep copy of HfstTransducer *another* or a transducer equivalent to
HfstBasicTransducer *another*.

Parameters
----------
* `another` :
    An HfstTransducer or HfstBasicTransducer.

An example:

     tr1 = hfst.regex('foo bar foo')
     tr2 = hfst.HfstTransducer(tr1)
     tr2.substitute('foo','FOO')
     tr1.concatenate(tr2)
"""

%feature("docstring") hfst::HfstTransducer::__init__
"""

Create an HFST transducer equivalent to HfstBasicTransducer *t*.

The type of the created transducer is defined by *type*.

Parameters
----------
* `t` :
    An HfstBasicTransducer.
* `type` :
    The type of the resulting transducer. If you want to use the default type,
    you can just call hfst.HfstTransducer(fsm)
"""

%feature("docstring") hfst::HfstTransducer::insert_to_alphabet
"""

Explicitly insert *symbol* to the alphabet of the transducer.

Parameters
----------
* `symbol` :
    The symbol (string) to be inserted.

note: Usually this function is not needed since new symbols are added to the
    alphabet by default.
"""

%feature("docstring") hfst::HfstTransducer::concatenate
"""

Concatenate this transducer with *another*.
"""

%feature("docstring") hfst::HfstTransducer::determinize
"""

Determinize the transducer.

Determinizing a transducer yields an equivalent transducer that has no state
with two or more transitions whose input:output symbol pairs are the same.
"""

%feature("docstring") hfst::HfstTransducer::is_automaton
"""

Whether each transition in the transducer has equivalent input and output
symbols.

note: Transition with hfst.UNKNOWN on both sides IS NOT a transition with
    equivalent input and output symbols.

note: Transition with hfst.IDENTITY on both sides IS a transition with
    equivalent input and output symbols.
"""

%feature("docstring") hfst::HfstTransducer::minimize
"""

Minimize the transducer.

Minimizing a transducer yields an equivalent transducer with the smallest number
of states.

Bug
OpenFst's minimization algorithm seems to add epsilon transitions to weighted
transducers?
"""

%feature("docstring") hfst::HfstTransducer::set_property
"""

Set arbitrary string property *property* to *value*.

Parameters
----------
* `property` :
    A string naming the property.
* `value` :
    A string expressing the value of *property*.

set_property('name', 'name of the transducer') equals set_name('name of the
transducer').

note: While this function is capable of creating endless amounts of arbitrary
    metadata, it is suggested that property names are drawn from central
    repository, or prefixed with \"x-\". A property that does not follow this
    convention may affect the behavior of transducer in future releases.
"""

%feature("docstring") hfst::HfstTransducer::convert
"""

Convert the transducer into an equivalent transducer in format *type*.

If a weighted transducer is converted into an unweighted one, all weights are
lost. In the reverse case, all weights are initialized to the semiring's one.

A transducer of type hfst.types.SFST_TYPE, hfst.types.TROPICAL_OPENFST_TYPE,
hfst.types.LOG_OPENFST_TYPE or hfst.types.FOMA_TYPE can be converted into an
hfst.types.HFST_OL_TYPE or hfst.types.HFST_OLW_TYPE transducer, but an
hfst.types.HFST_OL_TYPE or hfst.types.HFST_OLW_TYPE transducer cannot be
converted to any other type.

note: For conversion between HfstBasicTransducer and HfstTransducer, see
    hfst.HfstTransducer.__init__ and hfst.HfstBasicTransducer.__init__
"""

%feature("docstring") hfst::HfstTransducer::remove_epsilons
"""

Remove all *epsilon:epsilon* transitions from the transducer so that the
resulting transducer is equivalent to the original one.
"""

%feature("docstring") hfst::HfstTransducer::repeat_n
"""

A concatenation of *n* transducers.
"""

%feature("docstring") hfst::HfstTransducer::number_of_arcs
"""

The number of transitions in the transducer.
"""

%feature("docstring") hfst::HfstTransducer::cross_product
"""

Make cross product of this transducer with *another*.

It pairs every string of this with every string of *another*. If strings are not
the same length, epsilon padding will be added in the end of the shorter string.

pre: Both transducers must be automata, i.e. map strings onto themselves.
"""

%feature("docstring") hfst::HfstTransducer::write
"""

Write the transducer in binary format to *ostr*.

Parameters
----------
* `ostr` :
    A hfst.HfstOutputStream where the transducer is written.
"""

%feature("docstring") hfst::HfstTransducer::lenient_composition
"""

Perform a lenient composition on this transducer and *another*.

TODO: explain more.
"""

%feature("docstring") hfst::HfstTransducer::remove_optimization
"""

Remove lookup optimization.

This effectively converts transducer (back) into default fst type.
"""

%feature("docstring") hfst::HfstTransducer::get_property
"""

Get arbitrary string propert *property*.

Parameters
----------
* `property` :
    The name of the property whose value is returned. get_property('name') works
    like get_name().
"""

%feature("docstring") hfst::HfstTransducer::get_alphabet
"""

Get the alphabet of the transducer.

The alphabet is defined as the set of symbols known to the transducer.

Returns
-------
A tuple of strings.
"""


// File: classhfst_1_1MultiCharSymbolTrie.xml


%feature("docstring") hfst::MultiCharSymbolTrie
"""

TODO: documentation ???
"""

%feature("docstring") hfst::MultiCharSymbolTrie::__init__
"""

TODO: documentation.
"""

%feature("docstring") hfst::MultiCharSymbolTrie::add
"""

TODO: documentation.

Parameters
----------
* `string` :
    const char *
"""


// File: classhfst_1_1PmatchContainer.xml


%feature("docstring") hfst::PmatchContainer
"""

A class for performing pattern matching.
"""

%feature("docstring") hfst::PmatchContainer::__init__
"""

Initialize a PmatchContainer.

Is this needed?
"""

%feature("docstring") hfst::PmatchContainer::__init__
"""

Create a PmatchContainer based on definitions *defs*.

*   defs A tuple of transducers in hfst.HFST_OLW_FORMAT defining how pmatch is
    done.

    See also: hfst.compile_pmatch_file
"""

%feature("docstring") hfst::PmatchContainer::get_profiling_info
"""

todo
"""

%feature("docstring") hfst::PmatchContainer::set_profile
"""

todo
"""

%feature("docstring") hfst::PmatchContainer::set_extract_tags_mode
"""

todo
"""

%feature("docstring") hfst::PmatchContainer::match
"""

Match input *input*.
"""

%feature("docstring") hfst::PmatchContainer::set_verbose
"""

todo
"""


// File: classhfst_1_1PrologReader.xml


%feature("docstring") hfst::PrologReader
"""

A class for reading input in prolog text format and converting it into
transducer(s).

An example that reads prolog input from file 'testfile.prolog' and creates the
corresponding transducers and prints them. If the input cannot be parsed, a
message showing the invalid line in prolog input is printed and reading is
stopped.

     with open('testfile.prolog', 'r') as f:
         try:
             r = hfst.PrologReader(f)
             for tr in r:
                 print(tr)
         except hfst.exceptions.NotValidPrologFormatException as e:
             print(e.what())
"""

%feature("docstring") hfst::PrologReader::next
"""

Return next element (for python version 2).

Needed for 'for ... in' statement.

     for transducer in prolog_reader:
         print(transducer)

Exceptions
----------
* `StopIteration` :
"""

%feature("docstring") hfst::PrologReader::__iter__
"""

An iterator to the reader.

Needed for 'for ... in' statement.

     for transducer in prolog_reader:
         print(transducer)
"""

%feature("docstring") hfst::PrologReader::__next__
"""

Return next element (for python version 3).

Needed for 'for ... in' statement.

     for transducer in prolog_reader:
         print(transducer)

Exceptions
----------
* `StopIteration` :
"""

%feature("docstring") hfst::PrologReader::__init__
"""

Create a PrologReader that reads input from file *f*.

Parameters
----------
* `f` :
    A python file.
"""

%feature("docstring") hfst::PrologReader::read
"""

Read next transducer.

Read next transducer description in prolog format and return a corresponding
transducer.

Exceptions
----------
* `hfst.exceptions.NotValidPrologFormatException` :
* `hfst.exceptions.EndOfStreamException` :
"""


// File: classhfst_1_1XreCompiler.xml


%feature("docstring") hfst::XreCompiler
"""

A compiler holding information needed to compile XREs.
"""

%feature("docstring") hfst::XreCompiler::__init__
"""

Construct compiler for unknown format transducers.
"""

%feature("docstring") hfst::XreCompiler::__init__
"""

Create compiler for *impl* format transducers.
"""

%feature("docstring") hfst::XreCompiler::define_list
"""

todo
"""

%feature("docstring") hfst::XreCompiler::is_function_definition
"""

Whether *name* is a function definition.
"""

%feature("docstring") hfst::XreCompiler::is_definition
"""

Whether *name* is a definition.
"""

%feature("docstring") hfst::XreCompiler::set_verbosity
"""

Set the verbosity of the compiler.

*   v True or False
"""

%feature("docstring") hfst::XreCompiler::undefine
"""

todo
"""

%feature("docstring") hfst::XreCompiler::setOutputToConsole
"""

(Windows-specific) Whether output is printed to console instead of standard
output.

*   v True or False
"""

%feature("docstring") hfst::XreCompiler::compile
"""

Compile a transducer defined by *xre*.

May return a pointer to *empty* transducer on non-fatal error. A None pointer is
returned on fatal error, if abort is not called.

Returns
-------
An HfstTransducer pointer.
"""

%feature("docstring") hfst::XreCompiler::set_expand_definitions
"""

Whether definitions are expanded.

*   v True or False
"""

%feature("docstring") hfst::XreCompiler::define_xre
"""

Add a definition macro.

Compilers will replace arcs labeled *name*, with a transducer defined by regular
expression *xre* in later phases of compilation.
"""

%feature("docstring") hfst::XreCompiler::define_transducer
"""

Add a definition macro.

Compilers will replace arcs labeled *name*, with a transducer *transducer* in
later phases of compilation.
"""

%feature("docstring") hfst::XreCompiler::define_function
"""

todo
"""

%feature("docstring") hfst::XreCompiler::getOutputToConsole
"""

(Windows-specific) Whether output is printed to console instead of standard
output.
"""


// File: exceptions_2____init_____8py.xml


// File: ____init_____8py.xml


// File: namespacehfst_1_1exceptions.xml


// File: namespacehfst_1_1rules.xml

%feature("docstring") hfst::rules::two_level_if
"""

A transducer that obligatorily performs the mappings defined by *mappings* in
the context *context* when the alphabet is *alphabet*.

Parameters
----------
* `context` :
    A pair of transducers where the first transducer defines the left context
    and the second transducer the right context.
* `mappings` :
    A set of mappings (a tuple of string pairs) that the resulting transducer
    will perform in the context given in *context*.
* `alphabet` :
    The set of symbol pairs (a tuple of string pairs) that defines the alphabet
    (see the example).

For example, a transducer yielded by the following arguments (in pseudcode)

     context = pair( [c|d], [e] )
     mappings = set(a:b)
     alphabet = set(a, a:b, b, c, d, e, ...) obligatorily maps the symbol a to b
if c or d precedes and e follows. (Elsewhere, the mapping of a to b is
optional). This expression is identical to ![.* [c|d] [a:. & !a:b] [e] .*] Note
that the alphabet must contain the pair a:b here.

See also: SFST manual
"""

%feature("docstring") hfst::rules::replace_down
"""

The same as replace_up, but matching is done on the output side of *mapping*.

See also: replace_up SFST manual.
"""

%feature("docstring") hfst::rules::replace_down
"""

The same as replace_down(context, mapping, optional, alphabet) but *mapping* is
performed in every context.

See also: replace_up
"""

%feature("docstring") hfst::rules::deep_restriction_and_coercion
"""

A transducer that is equivalent to the intersection of deep_restriction and
deep_coercion.

See also: deep_restriction deep_coercion SFST manual.

Parameters
----------
* `contexts` :
    A tuple of HfstTransducer pairs.
* `mapping` :
    An HfstTransducer.
* `alphabet` :
    A tuple of string pairs.
"""

%feature("docstring") hfst::rules::surface_restriction_and_coercion
"""

A transducer that is equivalent to the intersection of surface_restriction and
surface_coercion.

See also: surface_restriction surface_coercion SFST manual.

Parameters
----------
* `contexts` :
    A tuple of HfstTransducer pairs.
* `mapping` :
    An HfstTransducer.
* `alphabet` :
    A tuple of string pairs.
"""

%feature("docstring") hfst::rules::left_replace_down_karttunen
"""

Inversion of the replace_up and the result needs to be composed on the upper
side of the input language.

However, matching is done on the output side of *mapping*.

See also: replace_up
"""

%feature("docstring") hfst::rules::coercion
"""

A transducer that requires that one of the mappings defined by *mapping* must
occur in each context in *contexts*.

Symbols outside of the matching substrings are mapped to any symbol allowed by
*alphabet*.

See also: SFST manual.

Parameters
----------
* `contexts` :
    A tuple of HfstTransducer pairs.
* `mapping` :
    An HfstTransducer.
* `alphabet` :
    A tuple of string pairs.
"""

%feature("docstring") hfst::rules::left_replace_down
"""

Inversion of the replace_up and the result needs to be composed on the upper
side of the input language.

However, matching is done on the output side of *mapping*.

See also: replace_up
"""

%feature("docstring") hfst::rules::surface_coercion
"""

A transducer that specifies that a string from the input language of the
transducer *mapping* always has to the mapped to one of its output strings
according to transducer *mapping* if it appears in any of the contexts in
*contexts*.

Symbols outside of the matching substrings are mapped to any symbol allowed by
*alphabet*.

See also: SFST manual.

Parameters
----------
* `contexts` :
    A tuple of HfstTransducer pairs.
* `mapping` :
    An HfstTransducer.
* `alphabet` :
    A tuple of string pairs.
"""

%feature("docstring") hfst::rules::deep_coercion
"""

A transducer that specifies that a string from the output language of the
transducer *mapping* always has to be mapped to one of its input strings
(according to transducer *mappings*) if it appears in any of the contexts in
*contexts*.

Symbols outside of the matching substrings are mapped to any symbol allowed by
*alphabet*.

See also: SFST manual.

Parameters
----------
* `contexts` :
    A tuple of HfstTransducer pairs.
* `mapping` :
    An HfstTransducer.
* `alphabet` :
    A tuple of string pairs.
"""

%feature("docstring") hfst::rules::replace_down_karttunen
"""

TODO: document.
"""

%feature("docstring") hfst::rules::replace_left
"""

The same as replace_up, but left context matching is done on the output side of
*mapping* and right context on the input side of *mapping*.

See also: replace_up
"""

%feature("docstring") hfst::rules::two_level_if_and_only_if
"""

A transducer that always performs the mappings defined by *mappings* in the
context *context* and only in that context, when the alphabet is *alphabet*.

If called with the same arguments as in the example of two_level_if, the
transducer maps symbol a to b only and only if c or d precedes and e follows.
The mapping of a to b is obligatory in this context and cannot occur in any
other context.

The expression is equivalent to ![.* [c|d] [a:. & !a:b] [e] .*] & ![ [ ![.*
[c|d]] a:b .* ] | [ .* a:b ![[e] .*] ] ]

See also: two_level_if
"""

%feature("docstring") hfst::rules::surface_restriction
"""

A transducer that specifies that a string from the input language of the
transducer *mapping* may only be mapped to one of its output strings (according
to transducer *mapping*) if it appears in any of the contexts in *contexts*.

Symbols outside of the matching substrings are mapped to any symbol allowed by
*alphabet*.

See also: SFST manual.

Parameters
----------
* `contexts` :
    A tuple of HfstTransducer pairs.
* `mapping` :
    An HfstTransducer.
* `alphabet` :
    A tuple of string pairs.
"""

%feature("docstring") hfst::rules::left_replace_left
"""

Inversion of the replace_up and the result needs to be composed on the upper
side of the input language.

However, left context matching is done on the input side of *mapping* and right
context on the output side of *mapping*.

See also: replace_up */
"""

%feature("docstring") hfst::rules::deep_restriction
"""

A transducer that specifies that a string from the output language of the
transducer *mapping* may only be mapped to one of its input strings (according
to transducer *mappings*) if it appears in any of the contexts in
*contexts.Symbols* outside of the matching substrings are mapped to any symbol
allowed by *alphabet*.

See also: SFST manual.

Parameters
----------
* `contexts` :
    A tuple of HfstTransducer pairs.
* `mapping` :
    An HfstTransducer.
* `alphabet` :
    A tuple of string pairs.
"""

%feature("docstring") hfst::rules::left_replace_up
"""

Inversion of the replace_up and the result needs to be composed on the upper
side of the input language.

B <- A is the inversion of A -> B. *mapping* is performed in every context.

See also: replace_up
"""

%feature("docstring") hfst::rules::left_replace_up
"""

Inversion of the replace_up and the result needs to be composed on the upper
side of the input language.

B <- A is the inversion of A -> B.

See also: replace_up
"""

%feature("docstring") hfst::rules::left_replace_right
"""

Inversion of the replace_up and the result needs to be composed on the upper
side of the input language.

However, left context matching is done on the output side of *mapping* and right
context on the input side of *mapping*.

See also: replace_up
"""

%feature("docstring") hfst::rules::replace_up
"""

A transducer that performs an upward mapping *mapping* in the context *context*
when the alphabet is *alphabet*.

*optional* defines whether the mapping is optional.

Parameters
----------
* `context` :
    A pair of transducers where the first transducer defines the left context
    and the second transducer the right context. Both transducers must be
    automata, i.e. map strings onto themselves.
* `mapping` :
    The mapping (transducer) that the resulting transducer will perform in the
    context given in *context*.
* `optional` :
    Whether the mapping is optional.
* `alphabet` :
    The set of symbol pairs that defines the alphabet (a tuple of string pairs).

Each substring s of the input string which is in the input language of the
transducer *mapping* and whose left context is matched by the expression [.* l]
(where l is the first element of *context*) and whose right context is matched
by [r .*] (where r is the second element in the context) is mapped to the
respective surface strings defined by transducer *mapping*. Any other character
is mapped to the characters specified in *alphabet*. The left and right contexts
must be automata (i.e. transducers which map strings onto themselves).

For example, a transducer yielded by the following arguments (in pseudocode)

     context = pair( [c], [c] )
     mappings = [ a:b a:b ]
     alphabet = set(a, b, c) would map the string \"caacac\" to \"cbbcac\".

Note that the alphabet must contain the characters a and b, but not the pair a:b
(unless this replacement is to be allowed everywhere in the context).

Note that replace operations (unlike the two-level rules) have to be combined by
composition rather than intersection.

Exceptions
----------
* `ContextTransducersAreNotAutomataException` :

See also: SFST manual
"""

%feature("docstring") hfst::rules::replace_up
"""

The same as replace_up but *mapping* is performed in every context.

See also: replace_up
"""

%feature("docstring") hfst::rules::two_level_only_if
"""

A transducer that allows the mappings defined by *mappings* only in the context
*context*, when the alphabet is *alphabet*.

If called with the same arguments as in the example of two_level_if, the
transducer allows the mapping of symbol a to b only if c or d precedes and e
follows. The mapping of a to b is optional in this context but cannot occur in
any other context.

The expression is equivalent to ![ [ ![.* [c|d]] a:b .* ] | [ .* a:b ![[e] .*] ]
]

See also: two_level_if
"""

%feature("docstring") hfst::rules::restriction_and_coercion
"""

A transducer that is equivalent to the intersection of restriction and coercion
and requires that the mappings defined by *mapping* occur always and only in the
given contexts in *contexts*.

Symbols outside of the matching substrings are mapped to any symbol allowed by
*alphabet*.

See also: restriction coercion SFST manual

Parameters
----------
* `contexts` :
    A tuple of HfstTransducer pairs.
* `mapping` :
    An HfstTransducer.
* `alphabet` :
    A tuple of string pairs.
"""

%feature("docstring") hfst::rules::restriction
"""

A transducer that allows any (substring) mapping defined by *mapping* only if it
occurs in any of the contexts in *contexts*.

Symbols outside of the matching substrings are mapped to any symbol allowed by
*alphabet*.

Exceptions
----------
* `EmptySetOfContextsException` :

See also: SFST manual.

Parameters
----------
* `contexts` :
    A tuple of HfstTransducer pairs.
* `mapping` :
    An HfstTransducer.
* `alphabet` :
    A tuple of string pairs.
"""

%feature("docstring") hfst::rules::replace_right
"""

The same as replace_up, but left context matching is done on the input side of
*mapping* and right context on the output side of *mapping*.

See also: replace_up SFST manual.
"""


// File: namespacehfst_1_1types.xml


// File: namespacehfst.xml

%feature("docstring") set_default_fst_type
"""

Set the default implementation type.

Parameters
----------
* `impl` :
    An hfst.ImplementationType.

Set the implementation type (SFST_TYPE, TROPICAL_OPENFST_TYPE, FOMA_TYPE) that
is used by default by all operations that create transducers. The default value
is TROPICAL_OPENFST_TYPE
"""

%feature("docstring") read_att_transducer
"""

Read next transducer from AT&T file pointed by *f*.

*epsilonstr* defines the symbol used for epsilon in the file.

Parameters
----------
* `f` :
    A python file
* `epsilonstr` :
    How epsilon is represented in the file. By default, \"@_EPSILON_SYMBOL_@\"
    and \"@0@\" are both recognized.

If the file contains several transducers, they must be separated by \"--\"
lines. In AT&T format, the transition lines are of the form:

     [0-9]+[\\w]+[0-9]+[\\w]+[^\\w]+[\\w]+[^\\w]([\\w]+(-)[0-9]+(\\.[0-9]+))

and final state lines:

     [0-9]+[\\w]+([\\w]+(-)[0-9]+(\\.[0-9]+))

If several transducers are listed in the same file, they are separated by lines
of two consecutive hyphens \"--\". If the weight

     ([\\w]+(-)[0-9]+(\\.[0-9]+)) is missing, the transition or final state is
given a zero weight.

NOTE: If transition symbols contains spaces, they must be escaped as '@_SPACE_@'
because spaces are used as field separators. Both '@0@' and '@_EPSILON_SYMBOL_@'
are always interpreted as epsilons.

An example:

     0      1      foo      bar      0.3
     1      0.5
     --
     0      0.0
     --
     --
     0      0.0
     0      0      a        <eps>    0.2

The example lists four transducers in AT&T format: one transducer accepting the
string pair <'foo','bar'>, one epsilon transducer, one empty transducer and one
transducer that accepts any number of 'a's and produces an empty string in all
cases. The transducers can be read with the following commands (from a file
named 'testfile.att'):

     transducers = []
     ifile = open('testfile.att', 'r')
     try:
         while (True):
             t = hfst.read_att_transducer(ifile, '<eps>')
             transducers.append(t)
             print(\"read one transducer\")
     except hfst.exceptions.NotValidAttFormatException as e:
         print(\"Error reading transducer: not valid AT&T format.\")
     except hfst.exceptions.EndOfStreamException as e:
         pass
     ifile.close()
     print(\"Read %i transducers in total\" % len(transducers))

Epsilon will be represented as hfst.EPSILON in the resulting transducer. The
argument *epsilon_symbol* only denotes how epsilons are represented in *ifile*.

Bug
Empty transducers are in theory represented as empty strings in AT&T format.
However, this sometimes results in them getting interpreted as end-of-file. To
avoid this, use an empty line instead, i.e. a single newline character.

Exceptions
----------
* `NotValidAttFormatException` :
* `StreamNotReadableException` :
* `StreamIsClosedException` :
* `EndOfStreamException` :

See also: #write_att
"""

%feature("docstring") read_att_input
"""

Read AT&T input from the user and return a transducer.

Returns
-------
An HfstTransducer whose type is hfst.get_default_fst_type(). Read one AT&T line
at a time from standard input and finally return an equivalent transducer. An
empty line signals the end of input.
"""

%feature("docstring") compile_lexc_file
"""

Compile lexc file *filename* into a transducer.

Parameters
----------
* `filename` :
    The name of the lexc file.
* `kvargs` :
    Arguments recognized are: verbosity, with_flags, output.
* `verbosity` :
    The verbosity of the compiler, defaults to 0 (silent). Possible values are:
    0, 1, 2.
* `with_flags` :
    Whether lexc flags are used when compiling, defaults to False.
* `output` :
    Where output is printed. Possible values are sys.stdout, sys.stderr, a
    StringIO, sys.stderr being the default?
"""

%feature("docstring") fst_type_to_string
"""

Get a string representation of transducer implementation type *type*.

Parameters
----------
* `type` :
    An hfst.ImplementationType.
"""

%feature("docstring") epsilon_fst
"""

Get an epsilon transducer.

Parameters
----------
* `weight` :
    The weight of the final state. Epsilon transducer has one state that is
    final (with final weight *weight*), i.e. it recognizes the empty string.
"""

%feature("docstring") empty_fst
"""

Get an empty transducer.

Empty transducer has one state that is not final, i.e. it does not recognize any
string.
"""

%feature("docstring") compile_pmatch_expression
"""

Compile a pmatch expression into a tuple of transducers.

Parameters
----------
* `expr` :
    A string defining how pmatch is done.

See also: hfst.compile_pmatch_file
"""

%feature("docstring") start_xfst
"""

Start interactive xfst compiler.

Parameters
----------
* `kvargs` :
    Arguments recognized are: type, quit_on_fail.
* `quit_on_fail` :
    Whether the compiler exits on any error, defaults to False.
* `type` :
    Implementation type of the compiler, defaults to
    hfst.get_default_fst_type().
"""

%feature("docstring") compile_pmatch_file
"""

Compile pmatch expressions as defined in *filename* and return a tuple of
transducers.

An example:

If we have a file named streets.txt that contains:

define CapWord UppercaseAlpha Alpha* ; define StreetWordFr [{avenue} |
{boulevard} | {rue}] ; define DeFr [ [{de} | {du} | {des} | {de la}] Whitespace
] | [{d'} | {l'}] ; define StreetFr StreetWordFr (Whitespace DeFr) CapWord+ ;
regex StreetFr EndTag(FrenchStreetName) ;

we can run:

defs = hfst.compile_pmatch_file('streets.txt') const =
hfst.PmatchContainer(defs) assert cont.match(\"Je marche seul dans l'avenue des
Ternes.\") == \"Je marche seul dans l'<FrenchStreetName>avenue des
Ternes</FrenchStreetName>.\"
"""

%feature("docstring") fst
"""

Get a transducer that recognizes one or more paths.

Parameters
----------
* `arg` :
    See example below

Possible inputs:

     One unweighted identity path:
     'foo'  ->  [f o o]
     Weighted path: a tuple of string and number, e.g.
     ('foo',1.4)
     ('bar',-3)
     ('baz',0)
     Several paths: a list or a tuple of paths and/or weighted paths, e.g.
     ['foo', 'bar']
     ('foo', ('bar',5.0))
     ('foo', ('bar',5.0), 'baz', 'Foo', ('Bar',2.4))
     [('foo',-1), ('bar',0), ('baz',3.5)]
     A dictionary mapping strings to any of the above cases:
     {'foo':'foo', 'bar':('foo',1.4), 'baz':(('foo',-1),'BAZ')}
"""

%feature("docstring") get_default_fst_type
"""

Get default transducer implementation type.

If the default type is not set, it defaults to hfst.types.TROPICAL_OPENFST_TYPE
"""

%feature("docstring") regex
"""

Get a transducer as defined by regular expression *regexp*.

Parameters
----------
* `regexp` :
    The regular expression defined with Xerox transducer notation.
* `kvargs` :
    Argumnets recognized are: error.
* `error` :
    Where warnings and errors are printed. Possible values are sys.stdout,
    sys.stderr (the default), a StringIO or None, indicating a quiet mode.
"""

%feature("docstring") is_diacritic
"""

Whether symbol *symbol* is a flag diacritic.

Flag diacritics are of the form

     @[PNDRCU][.][A-Z]+([.][A-Z]+)?@
"""

%feature("docstring") compile_xfst_file
"""

Compile (is 'run' a better term?) xfst file *filename*.

Parameters
----------
* `filename` :
    The name of the xfst file.
* `kvargs` :
    Arguments recognized are: verbosity, quit_on_fail, output, type.
* `verbosity` :
    The verbosity of the compiler, defaults to 0 (silent). Possible values are:
    0, 1, 2.
* `quit_on_fail` :
    Whether the script is exited on any error, defaults to True.
* `output` :
    Where output is printed. Possible values are sys.stdout, sys.stderr, a
    StringIO, sys.stderr being the default?
* `type` :
    Implementation type of the compiler, defaults to
    hfst.get_default_fst_type().
"""

%feature("docstring") tokenized_fst
"""

Get a transducer that recognizes the concatenation of symbols or symbol pairs in
*arg*.

Parameters
----------
* `arg` :
    The symbols or symbol pairs that form the path to be recognized.

Example

     import libhfst
     tok = hfst.HfstTokenizer()
     tok.add_multichar_symbol('foo')
     tok.add_multichar_symbol('bar')
     tr = hfst.tokenized_fst(tok.tokenize('foobar', 'foobaz')) will create the
transducer [foo:foo bar:b 0:a 0:z]
"""

%feature("docstring") read_att_string
"""

Read a multiline string *att* and return a transducer.

Parameters
----------
* `att` :
    A string in AT&& format that defines the transducer.

Returns
-------
An HfstTransducer whose type is hfst.get_default_fst_type(). Read *att* and
create a transducer as defined in it.
"""

%feature("docstring") read_prolog_transducer
"""
"""


// File: rules_2____init_____8py.xml


// File: types_2____init_____8py.xml


// File: classhfst_1_1exceptions_1_1ContextTransducersAreNotAutomataException.xml


%feature("docstring") hfst::exceptions::ContextTransducersAreNotAutomataException
"""

Transducers given as rule context are not automata.

See also: hfst.HfstTransducer.is_automaton()
"""


// File: classhfst_1_1exceptions_1_1EmptySetOfContextsException.xml


%feature("docstring") hfst::exceptions::EmptySetOfContextsException
"""

The set of transducer pairs is empty.

Thrown by rule functions.
"""


// File: classhfst_1_1exceptions_1_1EmptyStringException.xml


%feature("docstring") hfst::exceptions::EmptyStringException
"""

An argument string is an empty string.

A transition symbol cannot be an empty string.
"""


// File: classhfst_1_1exceptions_1_1EndOfStreamException.xml


%feature("docstring") hfst::exceptions::EndOfStreamException
"""

The stream is at end.

Thrown by hfst.HfstTransducer hfst.HfstInputStream.__init__
"""


// File: classhfst_1_1exceptions_1_1FlagDiacriticsAreNotIdentitiesException.xml


%feature("docstring") hfst::exceptions::FlagDiacriticsAreNotIdentitiesException
"""

Flag diacritics encountered on one but not the other side of a transition.
"""


// File: classhfst_1_1exceptions_1_1FunctionNotImplementedException.xml


%feature("docstring") hfst::exceptions::FunctionNotImplementedException
"""

Function has not been implemented (yet).
"""


// File: classhfst_1_1exceptions_1_1HfstException.xml


%feature("docstring") hfst::exceptions::HfstException
"""

Base class for HfstExceptions.

Holds its own name and the file and line number where it was thrown.
"""

%feature("docstring") hfst::exceptions::HfstException::what
"""

A message describing the error in more detail.
"""


// File: classhfst_1_1exceptions_1_1HfstFatalException.xml


%feature("docstring") hfst::exceptions::HfstFatalException
"""

An error happened probably due to a bug in the HFST code.
"""


// File: classhfst_1_1exceptions_1_1HfstTransducerTypeMismatchException.xml


%feature("docstring") hfst::exceptions::HfstTransducerTypeMismatchException
"""

Two or more HfstTransducers are not of the same type.

Same as HfstTransducerTypeMismatchException ???
"""


// File: classhfst_1_1exceptions_1_1ImplementationTypeNotAvailableException.xml


%feature("docstring") hfst::exceptions::ImplementationTypeNotAvailableException
"""

The library required by the implementation type requested is not linked to HFST.
"""


// File: classhfst_1_1exceptions_1_1IncorrectUtf8CodingException.xml


%feature("docstring") hfst::exceptions::IncorrectUtf8CodingException
"""

String is not valid utf-8.

This exception suggests that an input string is not valid utf8.
"""


// File: classhfst_1_1exceptions_1_1MetadataException.xml


%feature("docstring") hfst::exceptions::MetadataException
"""

A piece of metadata in an HFST header is not supported.
"""


// File: classhfst_1_1exceptions_1_1MissingOpenFstInputSymbolTableException.xml


%feature("docstring") hfst::exceptions::MissingOpenFstInputSymbolTableException
"""

An OpenFst transducer does not have an input symbol table.

When converting from OpenFst to tropical or log HFST, the OpenFst transducer
must have at least an input symbol table. If the output symbol table is missing,
it is assumed to be equivalent to the input symbol table.

Thrown by hfst.HfstTransducer.__init__
"""


// File: classhfst_1_1exceptions_1_1NotTransducerStreamException.xml


%feature("docstring") hfst::exceptions::NotTransducerStreamException
"""

The stream does not contain transducers.

Thrown by hfst.HfstTransducer hfst.HfstInputStream.__init__

An example.

     f = open('foofile', 'w')
     f.write('This is an ordinary text file.\\n')
     f.close()
     try:
         instr = hfst.HfstInputStream('foofile')
         tr = instr.read()
         print(tr)
         instr.close()
     except hfst.exceptions.NotTransducerStreamException:
         print(\"Could not print transducer: the file does not contain binary
transducers.\")
"""


// File: classhfst_1_1exceptions_1_1NotValidAttFormatException.xml


%feature("docstring") hfst::exceptions::NotValidAttFormatException
"""

The stream is not in valid AT&T format.

An example:

     f = open('testfile1.att', 'w')
     f.write('0 1 a b\\n\\
     1 2 c\\n\\
     2\\n')
     f.close()
     f = hfst.hfst_open('testfile1.att', 'r')
     try:
         tr = hfst.read_att(f)
     except hfst.exceptions.NotValidAttFormatException:
         print('Could not read file: it is not in valid ATT format.')
     f.close() thrown by hfst.HfstTransducer.__init__
"""


// File: classhfst_1_1exceptions_1_1NotValidLexcFormatException.xml


%feature("docstring") hfst::exceptions::NotValidLexcFormatException
"""

The input is not in valid LexC format.
"""


// File: classhfst_1_1exceptions_1_1NotValidPrologFormatException.xml


%feature("docstring") hfst::exceptions::NotValidPrologFormatException
"""

The input is not in valid prolog format.
"""


// File: classhfst_1_1exceptions_1_1SpecifiedTypeRequiredException.xml


%feature("docstring") hfst::exceptions::SpecifiedTypeRequiredException
"""

The type of a transducer is not specified.

This exception is thrown when an implementation type argument is
hfst.types.ERROR_TYPE.
"""


// File: classhfst_1_1exceptions_1_1StateIndexOutOfBoundsException.xml


%feature("docstring") hfst::exceptions::StateIndexOutOfBoundsException
"""

The state number argument is not valid.

An example :

     tr = hfst.HfstBasicTransducer()
     tr.add_state(1)
     try:
         w = tr.get_final_weight(2)
     except hfst.exceptions.StateIndexOutOfBoundsException:
         print('State number 2 does not exist')
"""


// File: classhfst_1_1exceptions_1_1StateIsNotFinalException.xml


%feature("docstring") hfst::exceptions::StateIsNotFinalException
"""

State is not final (and cannot have a final weight).

An example :

     tr = hfst.HfstBasicTransducer()
     tr.add_state(1)
     # An exception is thrown as state number 1 is not final
     try:
         w = tr.get_final_weight(1)
     except hfst.exceptions.StateIsNotFinalException:
         print(\"State is not final.\")

You should use function hfst.HfstBasicTransducer.is_final_state if you are not
sure whether a state is final.

Thrown by hfst.HfstBasicTransducer get_final_weight.
"""


// File: classhfst_1_1exceptions_1_1StreamCannotBeWrittenException.xml


%feature("docstring") hfst::exceptions::StreamCannotBeWrittenException
"""

Stream cannot be written.

Thrown by hfst.HfstOutputStream.write and hfst.HfstTransducer.write_att
"""


// File: classhfst_1_1exceptions_1_1StreamIsClosedException.xml


%feature("docstring") hfst::exceptions::StreamIsClosedException
"""

Stream is closed.

Thrown by hfst.HfstTransducer.write_att hfst.HfstOutputStream.write

An example:

     try:
         tr = hfst.regex('foo')
         outstr = hfst.HfstOutputStream(filename='testfile')
         outstr.close()
         outstr.write(tr)
     except hfst.exceptions.StreamIsClosedException:
         print(\"Could not write transducer: stream to file was closed.\")
"""


// File: classhfst_1_1exceptions_1_1StreamNotReadableException.xml


%feature("docstring") hfst::exceptions::StreamNotReadableException
"""

Stream cannot be read.
"""


// File: classhfst_1_1exceptions_1_1SymbolNotFoundException.xml


%feature("docstring") hfst::exceptions::SymbolNotFoundException
"""

A bug in the HFST code.
"""


// File: classhfst_1_1exceptions_1_1TransducerHasWrongTypeException.xml


%feature("docstring") hfst::exceptions::TransducerHasWrongTypeException
"""

Transducer has wrong type.

This exception suggests that an HfstTransducer has not been properly
initialized, probably due to a bug in the HFST library. Alternatively the
default constructor of HfstTransducer has been called at some point.

See also: hfst.HfstTransducer.__init__
"""


// File: classhfst_1_1exceptions_1_1TransducerHeaderException.xml


%feature("docstring") hfst::exceptions::TransducerHeaderException
"""

Transducer has a malformed HFST header.

Thrown by hfst.HfstTransducer.__init__ hfst.HfstInputStream
"""


// File: classhfst_1_1exceptions_1_1TransducerIsCyclicException.xml


%feature("docstring") hfst::exceptions::TransducerIsCyclicException
"""

Transducer is cyclic.

Thrown by hfst.HfstTransducer.extract_paths. An example

     transducer = hfst.regex('[a:b]*')
     try:
         results = transducer.extract_paths(output='text')
         print(\"The transducer has %i paths:\" % len(results))
         print(results)
     except hfst.exceptions.TransducerIsCyclicException:
         print(\"The transducer is cyclic and has an infinite number of paths.
Some of them:\")
         results = transducer.extract_paths(output='text', max_cycles=5)
         print(results)
"""


// File: classhfst_1_1exceptions_1_1TransducerTypeMismatchException.xml


%feature("docstring") hfst::exceptions::TransducerTypeMismatchException
"""

Two or more transducers do not have the same type.

This can happen if (1) the calling and called transducer in a binary operation,
(2) two transducers in a pair of transducers, (3) two consecutive transducers
coming from an HfstInputStream or (4) two transducers in a function taking two
or more transducers as arguments do not have the same type.

An example:

     hfst.set_default_fst_type(hfst.types.TROPICAL_OPENFST_TYPE)
     tr1 = hfst.regex('foo')
     tr2 = hfst.regex('bar')
     tr2.convert(hfst.types.FOMA_TYPE)
     try:
         tr1.disjunct(tr2)
     except hfst.exceptions.TransducerTypeMismatchException:
         print('The implementation types of transducers must be the same.')
"""


// File: classhfst_1_1exceptions_1_1TransducersAreNotAutomataException.xml


%feature("docstring") hfst::exceptions::TransducersAreNotAutomataException
"""

Transducers are not automata.

Example:

     tr1 = hfst.regex('foo:bar')
     tr2 = hfst.regex('bar:baz')
     try:
         tr1.cross_product(tr2)
     except hfst.exceptions.TransducersAreNotAutomataException:
         print('Transducers must be automata in cross product.') This exception
is thrown by hfst.HfstTransducer.cross_product when either input transducer does
not have equivalent input and output symbols in all its transitions.
"""

