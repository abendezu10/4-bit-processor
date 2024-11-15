import top(
  input clk,
  input opcode,
  input [3:0] data_in1,
  input [3:0] data_in2,
  output [4:0] data_o
  );


  alu alu_element(
    .num1(data_in1),
    .num2(data_in2),
    .opcode(opcode),
    .led(data_o)
    );


