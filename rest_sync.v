module reset_sync(
    input clk,rstn,
    input in,
    output  reg out);

reg q1, mrstn;



always@( posedge clk or negedge rstn)
begin
    if(!rstn) begin
        q1 <= 0;
        mrstn <= 0;
    end
    else begin
        q1 <= 1;
        mrstn <= q1;
    end
end

always@(posedge clk)
begin
    if(!mrstn)
        out <= 0;
    else
        out <= in;
end
endmodule 
