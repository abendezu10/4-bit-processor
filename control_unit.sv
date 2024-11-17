module control_unit(

  input logic clk,
  input logic rst,
  

  output reg_out,
  output oper_out,
  output [1:0] number,
  output [4:0] led
  );

  logic in_rego;
  logic in_opero;
  logic [1:0] in_num;
  logic [4:0] in_led;

  assign reg_out = in_rego;
  assign oper_out = in opero;
  assign number = in_num;
  assign led = in_led;


  // 1. Fetches the isntruction from memory

  // 2. Decodes instruction, in this case, 1 bit for register, 1 bit for the
  // operation, 2 bit for the number.
  
  localparam CU_IDLE_STATE = 3'd0;
  localparam CU_FETCH_STATE = 3'd1 ;
  localparam CU_DECODE_STATE = 3'd2;
  localparam CU_EXECUTE_STATE = 3'd3;
  localparam CU_WRITE_BACK_STATE = 3'd4;
  
  logic [2:0] state = CU_IDLE_STATE;
  logic [3:0] instr;
  logic [3:0] pc = 4'd0;

  instr_mem imem(
    .instr_addr(pc),
    .data_o(instr)
    );

  registers reg_m (
    .

    )
  // State Transitioning
  always_ff @ (posedge clk or posedge rst) begin
    if(!rst) begin
      state <= CU_IDLE_STATE;
      pc <= 4'd0;
      instr <= 4'd0;
    end else begin
      
      case(state) 

        CU_IDLE_STATE: begin
          state <= CU_FETCH_STATE
        end

        CU_FETCH_STATE: begin
          if(instr >= 4'd0) begin
            state = CU_DECODE_STATE;
          end 

        CU_DECODE_STATE:
          reg_out <= instr[0];
          op_out <= instr[1];
          number <= instr[2:3];
          if(instr >= 4'd0)begin
            state = CU_EXECUTE_STATE;
          end
        
        CU_EXECUTE_STATE:begin
          state <= CU_WRITE_BACK_STATE;
        end

        CU_WRITE_BACK_STATE: begin
          pc = pc + 1,
          state = CU_FETCH_STATE;

        end

        default: begin
          state = CU_IDLE_STATE;
        end

      end


    end

  end

endmodule
