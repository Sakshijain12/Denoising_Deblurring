n = 1:193; %taking the number of given values of y[n]
numdatay = xlsread('y[n].xlsx'); %reading the file y[n] where all values of y[n] are present
ynvalue(n) = numdatay(n,1);
subplot(2,3,1);
plot(n,ynvalue(n)); % plotting y[n] signal
title("y[n]");
xlabel("n");
ylabel("y[n]");

%taking average of next 5 terms to get denoised signal
for i= 1: 189
    ynvalue(i) = (ynvalue(i) + ynvalue(i+1) + ynvalue(i+2) + ynvalue(i+3) + ynvalue(i+4))/5
end
if n == 190
    ynvalue(n) = (ynvalue(n) + ynvalue(n+1) + ynvalue(n+2) + ynvalue(n+3))/4
end
if n == 191
    ynvalue(n) = (ynvalue(n) + ynvalue(n+1) + ynvalue(n+2))/3
end
if n == 192
    ynvalue(n) = (ynvalue(n) + ynvalue(n+1))/2
end
if n == 193
    ynvalue(n) = ynvalue(n) 
end

subplot(2,3,2);
plot(n,ynvalue(n)); %plotting the y[n] after denoising
title("y[n] after denoising");
xlabel("n");
ylabel("y[n]");

w= -pi:0.0326:pi; %sampling y[n] between -pi to +pi such that there are total 193 samples
for i = 1:length(w)
    yw(i) = sum(ynvalue(n).*exp(-1i*w(i).*n)); %calculating DTFT of y[n]
end


subplot(2,3,3);
plot(w,abs(yw)); %plotting fourier transform after denoising
xlabel("omega(w)");
ylabel("Y(e^j^w)");
title("Fourier transform of y[n] after denoising");

a = -2:2; %given value of n for h[n]
x = 1/16*[1,4,6,4,1]; % given h[n]
N = 193; % total values of n
X = fft(x,N); %calculating fourier transform of h[n]
w1 = 2*pi*(0:(N-1))/(N); %taking valid values of w
w3 = w1-pi;
subplot(2,3,4);
plot((w3),abs(fftshift(X))); % plotting fourier transform of h[n] in range of -pi to +pi
xlabel("omega(w)");
ylabel("H(e^j^w)");
title("Fourier tranform of h[n]");

t = abs(X)> 0.0000001; % not taking values of H(e^j^w) which are tending to zero
Xx = t.*abs(X);
dn = abs(yw)./Xx; % fourier tranform after deblurring
subplot(2,3,5);
plot(w,(dn/650000)); % plotting fourier tranform after deblurring
xlabel("omega(w)");
ylabel("X1(e^j^w)");
title("Fourier transform of y[n] after deblurring the denoised signal");

n = 1:193; %taking the number of given values of x[n]
numdatax = xlsread('x[n].xlsx'); %reading the file y[n] where all values of x[n] are present
xnvalue(n) = numdatax(n,1);
 
w4= -pi:0.0326:pi; %sampling x[n] between -pi to +pi such that there are total 193 samples
for i = 1:length(w4)
    xw(i) = sum(xnvalue(n).*exp(-1i*w4(i).*n)); %calculating DTFT of x[n]
end
subplot(2,3,6);
plot(w4,abs(xw)); %plotting X(e^j^w)
title("Fourier transform of x[n]");
xlabel("omega(w)");
ylabel("X(e^j^w)");