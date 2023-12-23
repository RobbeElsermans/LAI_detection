function [full_file_path,canceled] = ExportFile(file_extension,title, def_name)
%EXPORTFILE Summary of this function goes here
%   Detailed explanation goes here
full_file_path = "";
canceled = false;

[fileName, pathName] = uiputfile(file_extension, title,def_name);

if isequal(fileName,0) || isequal(pathName,0)
    canceled = true;
    return;
end

full_file_path = fullfile(pathName, fileName);

end

