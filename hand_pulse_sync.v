module hand_pulse_sync(
    input clk1,rstn1,sin,
    input clk2,rstn2,
    output out,busy);

reg q1,q2,q3,q4,q5,q6;

always@(posedge clk1 or negedge rstn1)
begin
    if(!rstn1) 
        q1 <= 0;
    else begin
        if(sin)
            q1 <= 1;
        else begin
            if(q6)
                q1 <= 0;
            else 
                q1 <= q1;
        end
    end
end

always@(posedge clk2 or negedge rstn2)
begin
    if(!rstn2)
        {q2,q3,q4} <= 0;
    else begin
        q2 <= q1;
        q3 <= q2; 
        q4 <= q3;
    end
end

assign out = q3&~q4;

always@(posedge clk1 or negedge rstn1)
begin
    if(!rstn1) 
        {q5,q6} <= 0;
    else begin  
        q5 <= q3;
        q6 <= q5;
    end
end

assign busy = q6|q1;
endmodule
