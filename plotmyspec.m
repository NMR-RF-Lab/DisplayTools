function plotmyspec(ppm, spec, ptitle, viewdim)
if nargin < 4
    viewdim = false;
    if nargin < 3
        ptitle = '';
    end
end

sz = size(spec);

% Check if dimension needs to be combined
% if numel(sz) > 2 || (sz(1) > 1 && sz(2) > 1)
%     for i = 2:numel(sz)
%         if i ~= viewdim
%             spec = sum(spec,i)./sz(i);
%         end
%     end
%     spec = squeeze(spec);
% end

% Check if data is complex
if ~isreal(spec(1,1,1))
    spec = real(spec);
end

figure('Theme','light')
plot(ppm, spec)
axis tight
set(gca, 'XDir', 'reverse')
xlabel('Frequency (ppm)')
ylabel('Amplitude (A.u.)')
title(ptitle)