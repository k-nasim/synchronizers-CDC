# synchronizers-CDC-
basic synchronizers used in CDC paths ( Verilog)



# Clock domain crossing

## metastability 
If the setup and hold time requirements are not met, the output of the flipflop may take much longer than Tco to a valid logic. This is called unstable behavior or metastability


![image](https://user-images.githubusercontent.com/130048247/235581154-0255d694-72a6-40f5-abc2-044a93bb636b.png)


## Mean time between failures
The metastability occurrences can be predicted by using the mean time between failures (MTBF) formula:
![image](https://user-images.githubusercontent.com/130048247/235584122-515aea66-4104-45ec-ab57-2b6bb6009515.png)


Where C1 and C2 are constants that depend on the technology used to build the flip-flop; tMET is the 
duration of the metastable output; and fclk and fdata are the frequencies of the synchronous clock and
the asynchronous input, respectively.



## flop synchronizer
![image](https://user-images.githubusercontent.com/130048247/235584188-c5521724-c6bc-4315-9196-00058bb3c539.png)


## mux synchronizer

instead of using a flop synchronizer for each flipflop, we can use a single flop synchronizer for each flipflop. We can use a single flop synchronizer to control the path for multi-bit data and that can be controlled by a mux
![image](https://user-images.githubusercontent.com/130048247/235584244-c5f746cc-afdb-4a36-bc20-e1674987041c.png)



## gray encoding
there may be some bits in the previous value and some are in the new value, to avoid these functional errors we use gray encoding (only one-bit changes at a time )

![image](https://user-images.githubusercontent.com/130048247/235584805-055a6548-3e43-46e6-985c-78c32e88a29c.png)



## Hand-shaking data between clock domain
Request signal synchronous with receiving clock domain and recognized correctly at receiving end. 
After data is captured correctly the destination end sends an acknowledgment signal to the transmitting domain end.
![image](https://user-images.githubusercontent.com/130048247/235584935-cd3cba43-36be-42bd-9ec0-1e4f840c8bec.png)

## Pulse synchronizers
Fast to slow clock domain (chances of missing pulse).
converting pulse to level.


Back-to-back pulses can't be handled in pulse synchronizers.
If more than one pulse comes handshake-based pulse synchronizer is used.
