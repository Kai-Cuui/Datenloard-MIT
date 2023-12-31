function Bit#(1) and1(Bit#(1) a, Bit#(1) b);
    return a & b;
endfunction

function Bit#(1) or1(Bit#(1) a, Bit#(1) b);
    return a | b;
endfunction

function Bit#(1) xor1( Bit#(1) a, Bit#(1) b );
    return a ^ b;
endfunction

function Bit#(1) not1(Bit#(1) a);
    return ~ a;
endfunction

function Bit#(1) multiplexer1(Bit#(1) sel, Bit#(1) a, Bit#(1) b);
    return (sel == 0)? a : b;
endfunction

function Bit#(5) multiplexer5(Bit#(1) sel, Bit#(5) a, Bit#(5) b); Bit#(5) muxout;
    //return (sel == 0)? a : b;
    //Exercise 2
    //for (Integer i = 0; i < 5; i = i + 1) begin
    //    muxout[i] = multiplexer1(sel, a[i], b[i]);
    //end
    //return muxout;

    // Exercise 3

    return multiplexer_n(sel,a,b);
endfunction

typedef 5 N;
function Bit#(N) multiplexerN(Bit#(1) sel, Bit#(N) a, Bit#(N) b);
    return (sel == 0)? a : b;
endfunction

//typedef 32 N; // Not needed
function Bit#(n) multiplexer_n(Bit#(1) sel, Bit#(n) a, Bit#(n) b);
    return (sel == 0)? a : b;
endfunction

// Exercise 2
// use and, or, not gate implement mux
// mux = (a&~sel) | (b&sel)
function Bit#(1) multiplexer_1(Bit#(1) sel, Bit#(1)a, Bit#(1) b);
    return or1(and1(a,not1(sel)), and1(b,sel));
endfunction
