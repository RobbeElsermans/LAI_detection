clear;clc;

addpath('..\..\Export_information'); % Replace with the actual full path to your folder


LAI_matrix = [0.1 0.2; 0.87 0.55];

Export_LAImatrixToCSV(LAI_matrix, "", "test1.csv");

disp("Check")