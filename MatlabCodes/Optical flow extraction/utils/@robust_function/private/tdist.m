function y = tdist(x, p, type)
%TDIST   T-distribution robust function.
%   TDIST(X, P, TYPE) evaluates the t-distribution robust function
%   with parameters P at point(s) X.  P(1) corresponds to the exponent
%   alpha; P(2) corresponds to the scaling sigma.
%   TYPE selects the evaluation type:
%    - 0: function value
%    - 1: first derivative
%    - 2: second derivative
%  
%   This is a private member function of the class 'robust_function'. 
%
%   Author:  Stefan Roth, Department of Computer Science, Brown University
%   Contact: roth@cs.brown.edu
%   $Date: $
%   $Revision: $

% Copyright 2004-2006 Brown University, Providence, RI.
% 
%                         All Rights Reserved
% 
% Permission to use, copy, modify, and distribute this software and its
% documentation for any purpose other than its incorporation into a
% commercial product is hereby granted without fee, provided that the
% above copyright notice appear in all copies and that both that
% copyright notice and this permission notice appear in supporting
% documentation, and that the name of Brown University not be used in
% advertising or publicity pertaining to distribution of the software
% without specific, written prior permission.
% 
% BROWN UNIVERSITY DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
% INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR ANY
% PARTICULAR PURPOSE.  IN NO EVENT SHALL BROWN UNIVERSITY BE LIABLE FOR
% ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
% WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
% ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
% OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

  
  r = p(1);
  s = p(2);
  
  switch (type)
   case 0
    cnst = gammaln(r - 0.5) - gammaln(r) + 0.5 * log(2*pi*s^2);
    y = cnst + r * log(1 + 0.5 * (x / s).^2);
   case 1
    y = r * x ./ (s^2 * (1 + 0.5 * (x / s).^2));
   case 2
    y = r ./ (s^2 * (1 + 0.5 * (x / s).^2));
  end
  
% $$$   switch (type)
% $$$    case 0
% $$$     cnst = gammaln(r / 2) - gammaln((r + 1) / 2) + 0.5 * log(r * pi) + log(s);
% $$$     y = cnst + ((r + 1) / 2) * log(1 + ((x / s).^2 / r));
% $$$    case 1
% $$$     y = ((r + 1) / r) * x ./ (1 + ((x / 2).^2 / r));
% $$$    case 2
% $$$     y = ((r + 1) / r) ./ (1 + ((x / s).^2 / r));
% $$$   end