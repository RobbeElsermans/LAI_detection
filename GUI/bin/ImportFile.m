function [full_file_path,canceled] = ImportFile(file_extension)
%IMPORTFILE Summary of this function goes here
%   Detailed explanation goes here
canceled = 0;
[file,path] = uigetfile(file_extension);
if isequal(file,0)
    %disp('User selected Cancel');
    canceled = 1;
else
    %disp(['User selected ', fullfile(path,file)]);
    full_file_path = fullfile(path,file); %Transfer filepath
end
end

