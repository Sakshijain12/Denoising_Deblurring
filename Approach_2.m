n = 1:193; %taking the number of given values of y[n]
numdatay = xlsread('y[n].xlsx'); %reading the file y[n] where all values of y[n] are present
ynvalue(n) = numdatay((n),1);
w= -pi:0.0326:pi; %sampling y[n] between -pi to +pi such that there are total 193 samples
for i = 1:length(w)
    yw(i) = sum(ynvalue(n).*exp(-1i*w(i).*n)); %calculating DTFT of y[n]
end
subplot(2,3,1);
plot(w,abs(yw)); %plotting Y(e^j^w)
title("Fourier transform of y[n]");
xlabel("omega(w)");
ylabel("Y(e^j^w)");

a = -2:2; %given value of n for h[n]
F = [1/16,1/4,6/16,1/4,1/16]; % given h[n]
subplot(2,3,2);
stem(a,F); % plotting h[n]
xlabel("n");
ylabel("h[n]");
title("h[n]");

x = 1/16*[1,4,6,4,1]; % given h[n]
N = 193; % total values of n
X = fft(x,N); %calculating fourier transform of h[n]
w = 2*pi*(0:(N-1))/N; %taking valid values of w
w3 = (w-pi);
subplot(2,3,3);
plot(w3,abs(fftshift(X))); % plotting fourier transform of h[n] in range of -pi to +pi
xlabel("omega(w)");
ylabel("H(e^j^w)");
title("Fourier transform of h[n]");

p = (abs(yw))/100000;
q = abs((X))*2300;
b = p./q % fourier transform after deblurring
subplot(2,3,4);
plot(w3,b); % plotting fourier transform after deblurring
xlabel("omega(w)");
ylabel("Y(e^j^w)");
title("Fourier transform of y[n] after deblurring");

indices = (abs(b) > 100);
b = b.*indices; %taking only high power frequencies, lower power frequencies wil be noise
frequency = linspace(-pi,pi,length(b));
subplot(2,3,5);
plot(frequency,abs(b));
xlabel("omega(w)");
ylabel("X2(e^j^w)");
title("Fourier transform of y[n] after denoising the deblurred signal");

n = 1:193; %taking the number of given values of x[n]
numdatax = xlsread('x[n].xlsx'); %reading the file x[n] where all values of x[n] are present
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