% GE IH 7/29/2017
% Timeserize data analysis with R
% Based on http://a-little-book-of-r-for-time-series.readthedocs.io/en/latest/src/timeseries.html

%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Javad\Wayne Works\Other\0. Other Activities\2017.07.28 GE Hacktown\modelOutput.csv
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2017/07/31 10:21:59

%% Initialize variables.
filename = 'C:\Javad\Wayne Works\Other\0. Other Activities\2017.07.28 GE Hacktown\modelOutput.csv';
delimiter = ',';
startRow = 2;

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
Temperature = dataArray{:, 1};
Humidity = dataArray{:, 2};
Years = dataArray{:, 3};


%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             Case 2 - Decay Prevention                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd 'C:\Javad\Wayne Works\Other\0. Other Activities\2017.07.28 GE Hacktown';
scatter3(Humidity,Temperature,Years,'o','MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75])
xlabel('Humidity %')
ylabel('Temperature (F)')
zlabel('Years of Longevity')