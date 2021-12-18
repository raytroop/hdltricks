### $realtime vs $time

`$realtime` round the current time to `timeprecision`\
`$time` round the current time to integer

`%t` will scale the rounded value to represnet `timeprecision`\
[https://verificationacademy.com/forums/systemverilog/time-vs-realtime#answer-94062](https://verificationacademy.com/forums/systemverilog/time-vs-realtime#answer-94062)
[https://verificationacademy.com/forums/systemverilog/time-vs-realtime#answer-94096](https://verificationacademy.com/forums/systemverilog/time-vs-realtime#answer-94096)

```verilog
module tb;
  timeunit 10ns;
  timeprecision 1ps;

  initial begin
    $display("$realtime = %g", $realtime);
    $display("$time = %g", $time);
    // $realtime round to timeprecision
    // $time round to integer
    #1.10016
    $display("$realtime = %g", $realtime);
    $display("$time = %g", $time);

    // %t format will scale the rounded value to represent timeprecision
    $display("$realtime %%t = %t", $realtime);
    $display("$time %%t = %t", $time);
  end
endmodule
```
output
```
  $realtime = 0
  $time = 0
  $realtime = 1.1002
  $time = 1
  $realtime %t =                11002
  $time %t =                10000
```