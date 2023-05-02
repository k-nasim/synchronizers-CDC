# synchronizers-CDC-
basic synchronizers used in CDC paths ( Verilog)



# Clock domain crossing

## metastability 
If the setup and hold time requirements are not met, the output of the flipflop may take much longer than Tco to a valid logic. This is called unstable behavior or metastability


![image](https://user-images.githubusercontent.com/130048247/235581154-0255d694-72a6-40f5-abc2-044a93bb636b.png)


## flop synchronizer


## mux synchronizer

instead of using a flop synchronizer for each flipflop, we can use a single flop synchronizer for each flipflop. We can use a single flop synchronizer to control the path for multi-bit data and that can be controlled by a mux

## gray encoding
there may be some bits in the previous value and some are in the new value, to avoid these functional errors we use gray encoding (only one-bit changes at a time )


## Hand-shaking data between clock domain
Request signal synchronous with receiving clock domain and recognized correctly at receiving end. 
After data is captured correctly the destination end sends an acknowledgment signal to the transmitting domain end.

## Pulse synchronizers
Fast to slow clock domain (chances of missing pulse).
converting pulse to level.


Back-to-back pulses can't be handled in pulse synchronizers.
If more than one pulse comes handshake-based pulse synchronizer is used.
