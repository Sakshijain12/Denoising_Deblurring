
# Programming Assignment

This project is in the Signal and System course done by Sakshi Jain (B20ME065).

In this project given y[n] is the signal which is recorded by the sensors, that is, the observed value of temperature.
I have to process it by two ways and get x[n], that is, the real value of temperature.
Then comparing the given x[n] with which I got through the two ways.

The signal y[n] has additive noise and blur distortion in it.So the first ways is to remove noise first and then deblurring it and second way is to deblur first and then removing noise.

The signals we get through the two ways are x1[n] and x2[n].

I have done coding in MATLAB simulator.




## How to run the code?

Following are the steps to run our code in MATLAB:-
1. Two files are to made, one containing the values of x (true temperature) and other containing the y (observed temperature) respectively named as x[n].xslx and y[n].xslx.
2. Open the code, that we have provided with this submission in MATLAB named as Approach_1 and Approach_2 for the two ways of approach, in MATLAB and import x[n].xslx and y[n].xslx files in it.
3. The figures will appear when the code is being run in MATLAB.
4. The second last figure gives the fourier transform of observed signal(y[n]) after removing noise and deblurring the signal and the last figure is of fourier transform of true temperature(x[n]).

  
