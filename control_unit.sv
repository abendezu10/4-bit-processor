module control_unit(

  input [3:0] instruction,
  input clk,
  

  output register,
  output operation,
  output [1:0] number
  );

  // 1. Fetches the isntruction from memory
  // 2. Decodes instruction, in this case, 1 bit for register, 1 bit for the
  // operation, 2 bit for the number.

  localparam CU_IDLE_STATE = 2'd0
  localparam CU_FETCH_STATE = 2'1 ;
  localparam CU_DECODE_STATE = 2'd2;

  logic state = CU_IDLE_STATE;


  // State Transitioning
  always_ff @ (posedge clk) begin
    
    case()

  end
