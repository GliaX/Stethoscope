# Glia Stethoscope Validation Procedure

## Ideology
A stethoscope is a fundamental medical tool used by doctors worldwide to characterize heart and lung sounds. A spectral analysis of heart sounds has shown the frequencies of interest are 0-500Hz [1]. Similar analysis of respiratory sounds has shown the frequencies of interest are 0-2000Hz [2]. A stethoscope that can reliably transmit frequencies at these levels has the greatest potential to be diagnostically useful.

## Setup
There are many different stethoscope models made by numerous companies which each claim to have a superior product. Previous work by *Abella et al* objectively tested the acoustic properties of 6 different models by measuring the power spectrum of frequencies ranging from 37.5-1000 Hz to determine which stethoscope was most efficient at transmitting sound [3]. At the time of this testing (1992) the Littmann Cardiology II was found to have superior qualities.

More recently in 2008 *Finkelstein* expanded this evaluation to include a subjective component by having a group of clinicians use each model on numerous patients and rate the clarity and loudness of sound transduction. Coupling this rating with subjective data at this time it was found that the Littmann Cardiology III was the best device on the market [4].

The frequency response of various Glia Model stethoscopes was determined using an experimental setup modelled off of the one used by *Watrous, Grove and Bowen* [5] shown below.

![Approximate Test Setup](https://github.com/GliaX/Stethoscope/blob/master/testing/ModelSetup.PNG "Approximate Test Setup")

In the above topology, the balloon contains 2L of water (2000g), acoustic input is supplied via a pair of Monster DNA headphones and sounds were recorded using a Hama microphone. Audacity was used to create a 15 second audio clip of white noise which was played through the setup with the output of each stethoscope being recorded for spectral analysis. The spectrum produced by each stethoscope model was then compared to that of the Littmann Cardiology III. These plots are shown below     

## Results
![All Stethoscope Heads](https://github.com/GliaX/Stethoscope/blob/master/testing/AllStethComp.png "All Stethoscope Heads")
---
![Glia 2 Vs. Littmann Cardiology III](https://github.com/GliaX/Stethoscope/blob/master/testing/Litt3vsGlia2.png "Glia 2 Vs. Littmann Cardiology III")

## References 
[1] Rushmer, R.F. *Cardiovascular Dynamics 4th Edition* 1976 WB Saunders

[2]Pasterkamp H, Kraman S, Wodicka G. *Respiratory sounds. Advances beyond the stethoscope*. Am J RespirfckLRCrit Care Med 1997, 156: 974–987. 

[3] - Abella M, Formolo J, Penney DG. *Comparison of the acoustic properties of six popular stethoscopes* J Acoust Soc Am 1992 Apr;91(4 Pt 1):2224-2228

[4] - Finkelstein,E. *The Ultimate Acoustic Stethoscope Review* For Us Docs : The Consumer Magazine for Doctors [Online] available from : 
[http://www.forusdocs.com/reviews/Acoustic_Stethoscope_Review.htm](http://www.forusdocs.com/reviews/Acoustic_Stethoscope_Review.htm)
                           
[5] Watrous, RL. Grove, DM. Bowen, DL. *"Methods and Results in Characterizing Electronic Stethoscopes"* Computers in Cardiology 2002;29:653-656                                                                                                                
