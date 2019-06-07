function C = constructConfusion(actualLab, predictLab, constraints)
% constructConfusion: constructs confusion matrix given actual and
%   predicted labels
% usage: C = constructConfusion(actualLab,predictLab);
%    or: C = constructConfusion(actualLab,predictLab,constraints);
%
% arguments:
%   actualLab (mx1) - vector of indices representing true (known) labels
%   predictLab (mx1) - vector of indices representing predicted labels
%   constraints (kx2) - array representing indices of must-link and/or 
%       cannot-link constraints. If this is supplied, these points will be
%       removed from consideration in constructing the confusion matrix.
%

if nargin>2 % remove rows corresponding to constraints
   
    indRemove = unique(constraints(:));
    actualLab(indRemove) = [];
    predictLab(indRemove) = [];
    
end

numLabels = max([actualLab;predictLab]);
C = full(sparse(actualLab,predictLab,1,numLabels,numLabels));
