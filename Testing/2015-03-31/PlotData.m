%This script loads audio files and plots the spectrum of 4 different designs of the Glia Stethoscope for comparison with the Littmann Cardiac 3 (gold standard)

cd "C:\\Users\\Spencer\\Desktop\\Glia-STM\\Stethoscope\\2015-03-31_Tabletop_Testing" %This line needs to be changed to the location of the saved files
close all;clear all;clc; 

%loading files
goldData = load ("Gold_Standard_Spectrum.txt");%loading raw data from text files (generated in audacity)
steth1Data = load ("Steth1_Spectrum.txt");
steth2Data = load ("Steth2_Spectrum.txt");
steth3Data = load ("Steth3_Spectrum.txt");
steth4Data = load ("Steth4_Spectrum.txt");

FreqCutoff = 5e3; %papers have shown that important cardiac data is 0-500Hz, important resp info is 0-2kHz
Freq = goldData (:,1);%Frequency Spectrum is the same for all files
numSamples = (find(Freq > FreqCutoff,1) - 1 );
Freq = Freq(1:numSamples);

goldMag = goldData (1:numSamples,2);%Magnitude response of each model
steth1Mag = steth1Data (1:numSamples,2);
steth2Mag = steth2Data (1:numSamples,2);
steth3Mag = steth3Data (1:numSamples,2);
steth4Mag = steth4Data (1:numSamples,2);

%plotting data 
h1 = figure(1,'name','Glia Stethoscope Head Comparison');
plot(Freq,goldMag,'k',Freq,steth1Mag,'g',Freq,steth2Mag,'b',Freq,steth3Mag,'m',Freq,steth4Mag,'c',Freq,steth2Mag,'.b')
xlabel("Frequency (Hz)")
ylabel("Magnitude (dB)")
title("Glia Stethoscope Frequency Response")
legend ('Littmann Cardiology III','100% Infill, ABS, 3mm Channel','100% Infill, ABS, 6mm Channel','15% Infill, ABS, 3mm Channel','100% Infill, ABS, 3mm Channel,Deep Cup')

h2 = figure(2,'name','Glia Model 2 Vs. Littmann Cardiology III');
plot(Freq,goldMag,'color','m','Linewidth',2,Freq,steth2Mag,'color','b','Linewidth',2,Freq,abs(goldMag - steth2Mag),'color','r','Linewidth',2)
xlabel("Frequency (Hz)")
ylabel("Magnitude (dB)")
title("Glia Stethoscope Frequency Response \n Comparison of Littmann Cardiology III and Glia Model 2")
legend ('Littmann Cardiology III','100% Infill, ABS, 6mm Channel','Difference')
grid on 

return%Remove this line to create image files
print(h1,'-dpng','-color','AllStethComp.png');
print(h2,'-dpng','-color','Litt3vsGlia2.png');
