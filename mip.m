function I = mip(vol, msk, type)
% MIP Return the maximum or minimum intensity projection of the input volume, given an input mask.

if strcmp(type, 'minimum') || strcmp(type, 'min')
    mfun = @(x) min(x, [], 'omitnan');
elseif strcmp(type, 'maximum') || strcmp(type, 'max')
    mfun = @(x) max(x, [], 'omitnan');
else
    error('Invalid projection type.')
end

% Make values outside mask equal to NaN
vol(msk == false) = NaN;

% Create 2D mask
MSK = sum(msk,3) > 0;

% Preallocate memory
I = zeros([size(vol,1), size(vol,2)], 'like', vol); % initialized empty array

% Create mIP/MIP
for i = 1:size(vol,1)
    for j = 1:size(vol,2)
        % Check if pixel is included in any mask
        if MSK(i,j) == true
            mvals = zeros(1, P.SliceInfo.ns);
            for k = 1:size(vol,3)
                % Only use min/max value if it is in a mask
                if msk(i,j,k) ~= 0
                    mvals(k) = vol(i,j,k);
                else
                    mvals(k) = NaN;
                end
            end

            I(i,j) = mfun(mvals);
        end
    end
end