client(Host,Port):-
    setup_call_cleanup(
    tcp_connect(Host:Port, Stream,[]),
    bot(Stream),
    close(Stream)).
bot(Stream):-
    %atom_codes(Atom,String),
    %flush_output(Stream),
    %copy_stream_data(Stream,current_output),
    format(Stream,'~s~n',"ai_boris2"),
    %flush_output(Stream),
    %copy_stream_data(Stream,current_output),
    %read_stream(Stream,List),    %write(List),
    repeat,(
    (   maybe(1,2)->(
    maybe(1,2)->format(Stream,'~s~n',"north");format(Stream,'~s~n',"south"))
    ;(maybe(1,2)->format(Stream,'~s~n',"east");format(Stream,'~s~n',"west"))),
        sleep(10),
        format(Stream,'~s~n',"say NINININININININI"),fail
    ).
read_stream(Stream,[H|T]):-
    \+(at_end_of_stream(Stream))->
    (   read_line_to_string(Stream,H),
    read_stream(Stream,T)
    )
    ;
    T = [].

