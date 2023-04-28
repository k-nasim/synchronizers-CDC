module mux_sync (
    input clk1,rst1,
    input clk2,rst2,
    input en,
    input [2:0] datain,
    output reg [2:0] dataout
);

reg q1,q2,q3;
wire [2:0] m;
always@(posedge clk1 or negedge rst1)
begin
    if (rst1 == 0)
        q1 <= 0;
    else 
        q1 <= en;
end

always@(posedge clk2 or negedge rst2)
begin
    if(rst2 ==0) begin
        q2 <= 0;
        q3 <= 0;
        dataout <= 0;
    end
    else begin
        q2 <= q1;
        q3 <= q2;
        dataout <= m;

    end
end
    
assign m = q3?datain:dataout;
endmodule