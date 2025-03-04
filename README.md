# Beacon-Project

this project is designated to find the correlation between galactic noise with the BEACON antenna array signal.

The code have 3 main components:
1. Sampler, used to select event that are fit for construct a analysis map
2. Analyzer, used to extract data from event, further filter and process them to reduce noise to get the correlation.
3. fitter, used to plot out the graph by easy understandable visualization

in this study, due to the antenna is set up on ground of a mountain, the anthroprogenic noise is a significant factor respect to the galatic noise, which post an significant challenage to the research. 
Here, I mainly used the following method to analyze the data:

1. FFT graph for signal event (Frequency vs Amplitude)
2. Frequency Analysis across single day: (peak amplitude in single event FFT vs time in the day)
3. multi-channel medium Vrms analysis(plot out Vrms vs time in the day)
4. Amplitude capping (replace the amplitude in real time waveform once they exceed some certain value,   used to remove short extreme pulse. then plot Vrms vs time in the day )
5. sine subtraction(remove certain frequency signal in real space if the amplitude of such frequency has exceed certain portion of the whole signal, then plot V_rms vs time in the day)
