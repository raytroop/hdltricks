`timescale 1ns/1ns

// Due to minimum of timeprecision is 10ps
module rawplant;
  timeunit 1ns;
  timeprecision 100ps;

  task print;
    /*
    1ns: 1
    100ps:  6
    10ps: 6
    1ps: 6
    */
    #1.666
    $display("raw: $realtime = %g", $realtime);     // 1.7
    $display("raw: $time = %g", $time);             // 2
    $display("raw: $realtime %%t = %t", $realtime); // 1.7*1ns/10ps=170
    $display("raw: $time %%t = %t", $time);         // 2*1ns/10ps = 200
  endtask

endmodule

module fineplant;
  timeunit 100ps;
  timeprecision 10ps;

  task print;
    /*
    100ps: 2
    10ps: 6
    1ps: 6
    */
    #2.66
    $display("raw: $realtime = %g", $realtime);     // 2.7
    $display("raw: $time = %g", $time);             // 3
    $display("raw: $realtime %%t = %t", $realtime); // 2.7*100ps/10ps = 27
    $display("raw: $time %%t = %t", $time);         // 3*100ps/10ps = 30
  endtask

endmodule

module tb;
  rawplant rawblock();
  fineplant fineblock();

  initial begin
  fork
    rawblock.print();
    fineblock.print();
  join
  end
endmodule
