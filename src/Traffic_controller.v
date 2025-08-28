`timescale 1ns/1ps

module Traffic_controller (
input clk,rst,
output reg [1:0] NS, EW
);

parameter [1:0] NS_GREEN= 2'b00,
                NS_YELLOW= 2'b01,
                EW_GREEN= 2'b10,
                EW_YELLOW= 2'b11;

reg [1:0] state, next_state;
reg [31:0] timer;

localparam G_time= 10;
localparam Y_time= 5;

always @(posedge clk or negedge rst) begin
        if (!rst) begin
                 state <= NS_GREEN;
                 timer <= 0;
        end

        else begin
                 state <= next_state;
                 if (timer==0) begin
                      case(next_state)
                           NS_GREEN : timer<=G_time;
                           NS_YELLOW : timer<= Y_time;
                           EW_GREEN : timer<=G_time;
                           EW_YELLOW : timer<=Y_time;
                      endcase
                 end
                 else
                     timer <= timer-1;
       end
end

always @(*) begin
       case (state)
              NS_GREEN: begin
                      NS=2'b00; //GREEN
                      EW=2'b10; //RED
                      next_state= (timer==0)? NS_YELLOW : NS_GREEN; 
              end
              NS_YELLOW: begin
                      NS=2'b01;  //YELLOW
                      EW=2'b10;  //RED
                      next_state= (timer==0)? EW_GREEN : NS_YELLOW;
              end
              EW_GREEN: begin
                      NS=2'b10;  //RED
                      EW=2'b00;  //GREEN
                      next_state= (timer==0)? EW_YELLOW : EW_GREEN;
              end
              EW_YELLOW: begin
                      NS=2'b10;  //RED
                      EW=2'b01;  //YELLOW
              next_state= (timer==0)? NS_GREEN : EW_YELLOW ;
              end

              default: begin
                      NS=2'b00;  //GREEN
                      EW=2'b10;  //RED
              next_state= NS_GREEN;
              end
      endcase

end

endmodule

