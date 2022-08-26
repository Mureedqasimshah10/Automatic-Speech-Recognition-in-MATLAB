clc, clear all, close all;

storedirectory = 'G:\Semester 6\New folder\faizan\Semester 6\DSP Project\store-dataset';
testdirectory = 'G:\Semester 6\New folder\faizan\Semester 6\DSP Project\test-dataset';

Fs = 8000;
Fs1 = 40000;

signal = audioread(fullfile(testdirectory, 'test.wav'));
s = signal;
s=s';
s=s(1,:);
s=s';
r0=xcorr(s,s);
peak_0=max(r0)

s_1 = audioread(fullfile(storedirectory, 'sound_one.wav'));
s_1=s_1';     % taking transpose
s_1=s_1(1,:);
s_1=s_1';     % taking transpose
r1=xcorr(s,s_1);
peak_1=max(r1)
l1=length(r1);
t1=-((l1-1)/2):1:((l1-1)/2);
t1=t1';
figure
subplot(3,1,1)
plot(t1,r1);
%-------------------------
s_2 = audioread(fullfile(storedirectory, 'sound_two.wav'));
s_2=s_2';     
s_2=s_2(1,:);
s_2=s_2';     
r2=xcorr(s,s_2);
peak_2=max(r2)
l2=length(r2);
t2=-((l2-1)/2):1:((l2-1)/2);
t2=t2';
subplot(3,1,2)
plot(t2,r2);
%-------------------------
s_3 = audioread(fullfile(storedirectory, 'sound_three.wav'));
s_3=s_3';     
s_3=s_3(1,:);
s_3=s_3';    
r3=xcorr(s,s_3);
peak_3=max(r3)
l3=length(r3);
t3=-((l3-1)/2):1:((l3-1)/2);
t3=t3';
subplot(3,1,3)
plot(t3,r3);

%----------Comparison--------------

line  = [peak_0 peak_1 peak_2 peak_3];
max_peak = max(line)
sound_welcome = audioread(fullfile(storedirectory, 'welcome.wav'));
if max_peak==peak_1
     soundsc(sound_welcome, Fs1)
 
elseif max_peak==peak_2
        soundsc(sound_welcome, Fs1)
       
elseif max_peak==peak_3
        soundsc(sound_welcome,Fs1)        
else
    soundsc(audioread(fullfile(storedirectory, 'denied.wav')), Fs1)
end

