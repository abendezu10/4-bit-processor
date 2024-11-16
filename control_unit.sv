module control_unit(

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
  logic [3:0] pc = 4'd0;
  logic [3:0] instr;


  // State Transitioning
  always_ff @ (posedge clk) begin
    
    case(state)
      CU_FETCH_STATE: begin
        instr_mem mem_b (
            .instr_addr(pc),
            .data_o(instr)
          );
          if(instr != NULL) begin
            state = CU_DECODE_STATE;
          end


      end


    end
