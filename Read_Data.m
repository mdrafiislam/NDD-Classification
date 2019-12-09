close all;
clear all;
clc;

x=xlsread('Data Calculation.xlsx','Q9500:Q17999');

[stride, stance, swing]=process_signal(x);
features=calculate_features(stride, stance, swing);

% xlswrite('F:\Premier University as Lecturer\Research\Project-1\stride_stance_swing\stride_stance_swing.xlsx',stride','sheet1','A');
% xlswrite('F:\Premier University as Lecturer\Research\Project-1\stride_stance_swing\stride_stance_swing.xlsx',stance','sheet1','B');
% xlswrite('F:\Premier University as Lecturer\Research\Project-1\stride_stance_swing\stride_stance_swing.xlsx',swing','sheet1','C');
