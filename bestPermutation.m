function predictLabNew = bestPermutation(varargin)
% bestPermutation: find permutation of predicted labels that best matches
%   actual labels (in terms of RAND index)
% usage: predictLabNew = bestPermutation(actualLab,predictLab);
%    or: predictLabNew = bestPermutation(actualLab,predictLab,constraints);
%
% arguments:
%   actualLab (mx1) - vector of indices representing true (known) labels
%   predictLab (mx1) - vector of indices representing predicted labels
%   constraints (kx2) - array representing indices of must-link and/or 
%       cannot-link constraints. If this is supplied, these points will be
%       removed from consideration.
%
%   predictLabNew (mx1) - vector of indices representing predicted labels,
%       permuted to maximize RAND index
%

% author: XXXXXX

% construct confusion matrix
C = constructConfusion(varargin{:});

% get number of labels
numLabels = size(C,1);

% solve mukres assignment problem
p = munkres(sum(C(:))-C);

% create new set of predicted labels
predictLab = varargin{2};
predictLabNew = zeros(size(predictLab));
for i = 1:numLabels
    predictLabNew(predictLab==p(i)) = i;
end

