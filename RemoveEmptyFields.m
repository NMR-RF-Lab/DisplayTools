%REMOVEEMPTYFIELDS Remove empty fields from a structure.
%
%   s = RemoveEmptyFields(s)
%
%   Inputs
%           s: structure
%
%   Outputs
%           s: structure with empty fields removed
%           f: fields that were removed
% 
% Jacob Degitz, Texas A&M University
% Created 4/23/2026
% Last edited 4/23/2026

function [s, f] = RemoveEmptyFields(s)

% Parse inputs
p = inputParser;
addRequired(p, 's', @(x) (isstruct(x)))
parse(p, s)
s = p.Results.s;

% Get field names
f_all = fieldnames(s);

% Identify empty fields
flag = false(size(f_all));
for i = 1:numel(f_all)
    if isempty(s.(f_all{i}))
        flag(i) = true;
    end
end

% Remove fields
f = f_all(flag);
s = rmfield(s, f);