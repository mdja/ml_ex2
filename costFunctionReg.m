function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
for n=1:m,
	h = theta' * X(n,:)';
	h = sigmoid(h);
	J = J + (-y(n) .* log(h)) - ((1 - y(n)) .* log(1 - h));
	grad = grad + ( (h - y(n)) .* X(n,:)' ); 
end;
J = J ./ m;
grad = grad ./ m;

regJ = 0;
regTheta = 0;
for k=2:size(theta)
	regJ = regJ + (theta(k,1) * theta(k,1)) ;
	grad(k) = grad(k) + ( lambda * theta(k,1) / m);
end;

regJ = ( regJ * lambda) / (2 * m);
J = J + regJ;


% =============================================================

end
