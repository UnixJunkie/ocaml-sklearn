module AdaBoostClassifier : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?base_estimator:Py.Object.t -> ?n_estimators:int -> ?learning_rate:float -> ?algorithm:[`SAMME | `SAMME_R] -> ?random_state:[`Int of int | `RandomState of Py.Object.t | `None] -> unit -> t
(**
An AdaBoost classifier.

An AdaBoost [1] classifier is a meta-estimator that begins by fitting a
classifier on the original dataset and then fits additional copies of the
classifier on the same dataset but where the weights of incorrectly
classified instances are adjusted such that subsequent classifiers focus
more on difficult cases.

This class implements the algorithm known as AdaBoost-SAMME [2].

Read more in the :ref:`User Guide <adaboost>`.

.. versionadded:: 0.14

Parameters
----------
base_estimator : object, optional (default=None)
    The base estimator from which the boosted ensemble is built.
    Support for sample weighting is required, as well as proper
    ``classes_`` and ``n_classes_`` attributes. If ``None``, then
    the base estimator is ``DecisionTreeClassifier(max_depth=1)``.

n_estimators : int, optional (default=50)
    The maximum number of estimators at which boosting is terminated.
    In case of perfect fit, the learning procedure is stopped early.

learning_rate : float, optional (default=1.)
    Learning rate shrinks the contribution of each classifier by
    ``learning_rate``. There is a trade-off between ``learning_rate`` and
    ``n_estimators``.

algorithm : {'SAMME', 'SAMME.R'}, optional (default='SAMME.R')
    If 'SAMME.R' then use the SAMME.R real boosting algorithm.
    ``base_estimator`` must support calculation of class probabilities.
    If 'SAMME' then use the SAMME discrete boosting algorithm.
    The SAMME.R algorithm typically converges faster than SAMME,
    achieving a lower test error with fewer boosting iterations.

random_state : int, RandomState instance or None, optional (default=None)
    If int, random_state is the seed used by the random number generator;
    If RandomState instance, random_state is the random number generator;
    If None, the random number generator is the RandomState instance used
    by `np.random`.

Attributes
----------
base_estimator_ : estimator
    The base estimator from which the ensemble is grown.

estimators_ : list of classifiers
    The collection of fitted sub-estimators.

classes_ : array of shape (n_classes,)
    The classes labels.

n_classes_ : int
    The number of classes.

estimator_weights_ : array of floats
    Weights for each estimator in the boosted ensemble.

estimator_errors_ : array of floats
    Classification error for each estimator in the boosted
    ensemble.

feature_importances_ : ndarray of shape (n_features,)
    The feature importances if supported by the ``base_estimator``.

See Also
--------
AdaBoostRegressor
    An AdaBoost regressor that begins by fitting a regressor on the
    original dataset and then fits additional copies of the regressor
    on the same dataset but where the weights of instances are
    adjusted according to the error of the current prediction.

GradientBoostingClassifier
    GB builds an additive model in a forward stage-wise fashion. Regression
    trees are fit on the negative gradient of the binomial or multinomial
    deviance loss function. Binary classification is a special case where
    only a single regression tree is induced.

sklearn.tree.DecisionTreeClassifier
    A non-parametric supervised learning method used for classification.
    Creates a model that predicts the value of a target variable by
    learning simple decision rules inferred from the data features.

References
----------
.. [1] Y. Freund, R. Schapire, "A Decision-Theoretic Generalization of
       on-Line Learning and an Application to Boosting", 1995.

.. [2] J. Zhu, H. Zou, S. Rosset, T. Hastie, "Multi-class AdaBoost", 2009.

Examples
--------
>>> from sklearn.ensemble import AdaBoostClassifier
>>> from sklearn.datasets import make_classification
>>> X, y = make_classification(n_samples=1000, n_features=4,
...                            n_informative=2, n_redundant=0,
...                            random_state=0, shuffle=False)
>>> clf = AdaBoostClassifier(n_estimators=100, random_state=0)
>>> clf.fit(X, y)
AdaBoostClassifier(n_estimators=100, random_state=0)
>>> clf.feature_importances_
array([0.28..., 0.42..., 0.14..., 0.16...])
>>> clf.predict([[0, 0, 0, 0]])
array([1])
>>> clf.score(X, y)
0.983...
*)

val get_item : index:Py.Object.t -> t -> Py.Object.t
(**
Return the index'th estimator in the ensemble.
*)

val decision_function : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Compute the decision function of ``X``.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples. Sparse matrix can be CSC, CSR, COO,
    DOK, or LIL. COO, DOK, and LIL are converted to CSR.

Returns
-------
score : array, shape = [n_samples, k]
    The decision function of the input samples. The order of
    outputs is the same of that of the :term:`classes_` attribute.
    Binary classification is a special cases with ``k == 1``,
    otherwise ``k==n_classes``. For binary classification,
    values closer to -1 or 1 mean more like the first or second
    class in ``classes_``, respectively.
*)

val fit : ?sample_weight:Ndarray.t -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> y:Ndarray.t -> t -> t
(**
Build a boosted classifier from the training set (X, y).

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples. Sparse matrix can be CSC, CSR, COO,
    DOK, or LIL. COO, DOK, and LIL are converted to CSR.

y : array-like of shape (n_samples,)
    The target values (class labels).

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights. If None, the sample weights are initialized to
    ``1 / n_samples``.

Returns
-------
self : object
    Fitted estimator.
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get parameters for this estimator.

Parameters
----------
deep : bool, default=True
    If True, will return the parameters for this estimator and
    contained subobjects that are estimators.

Returns
-------
params : mapping of string to any
    Parameter names mapped to their values.
*)

val predict : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict classes for X.

The predicted class of an input sample is computed as the weighted mean
prediction of the classifiers in the ensemble.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples. Sparse matrix can be CSC, CSR, COO,
    DOK, or LIL. COO, DOK, and LIL are converted to CSR.

Returns
-------
y : ndarray of shape (n_samples,)
    The predicted classes.
*)

val predict_log_proba : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict class log-probabilities for X.

The predicted class log-probabilities of an input sample is computed as
the weighted mean predicted class log-probabilities of the classifiers
in the ensemble.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples. Sparse matrix can be CSC, CSR, COO,
    DOK, or LIL. COO, DOK, and LIL are converted to CSR.

Returns
-------
p : array of shape (n_samples, n_classes)
    The class probabilities of the input samples. The order of
    outputs is the same of that of the :term:`classes_` attribute.
*)

val predict_proba : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict class probabilities for X.

The predicted class probabilities of an input sample is computed as
the weighted mean predicted class probabilities of the classifiers
in the ensemble.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples. Sparse matrix can be CSC, CSR, COO,
    DOK, or LIL. COO, DOK, and LIL are converted to CSR.

Returns
-------
p : array of shape (n_samples, n_classes)
    The class probabilities of the input samples. The order of
    outputs is the same of that of the :term:`classes_` attribute.
*)

val score : ?sample_weight:Ndarray.t -> x:Ndarray.t -> y:Ndarray.t -> t -> float
(**
Return the mean accuracy on the given test data and labels.

In multi-label classification, this is the subset accuracy
which is a harsh metric since you require for each sample that
each label set be correctly predicted.

Parameters
----------
X : array-like of shape (n_samples, n_features)
    Test samples.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    True labels for X.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights.

Returns
-------
score : float
    Mean accuracy of self.predict(X) wrt. y.
*)

val set_params : ?params:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of this estimator.

The method works on simple estimators as well as on nested objects
(such as pipelines). The latter have parameters of the form
``<component>__<parameter>`` so that it's possible to update each
component of a nested object.

Parameters
----------
**params : dict
    Estimator parameters.

Returns
-------
self : object
    Estimator instance.
*)

val staged_decision_function : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Py.Object.t
(**
Compute decision function of ``X`` for each boosting iteration.

This method allows monitoring (i.e. determine error on testing set)
after each boosting iteration.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples. Sparse matrix can be CSC, CSR, COO,
    DOK, or LIL. COO, DOK, and LIL are converted to CSR.

Yields
------
score : generator of array, shape = [n_samples, k]
    The decision function of the input samples. The order of
    outputs is the same of that of the :term:`classes_` attribute.
    Binary classification is a special cases with ``k == 1``,
    otherwise ``k==n_classes``. For binary classification,
    values closer to -1 or 1 mean more like the first or second
    class in ``classes_``, respectively.
*)

val staged_predict : x:Ndarray.t -> t -> Py.Object.t
(**
Return staged predictions for X.

The predicted class of an input sample is computed as the weighted mean
prediction of the classifiers in the ensemble.

This generator method yields the ensemble prediction after each
iteration of boosting and therefore allows monitoring, such as to
determine the prediction on a test set after each boost.

Parameters
----------
X : array-like of shape (n_samples, n_features)
    The input samples. Sparse matrix can be CSC, CSR, COO,
    DOK, or LIL. COO, DOK, and LIL are converted to CSR.

Yields
------
y : generator of array, shape = [n_samples]
    The predicted classes.
*)

val staged_predict_proba : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Py.Object.t
(**
Predict class probabilities for X.

The predicted class probabilities of an input sample is computed as
the weighted mean predicted class probabilities of the classifiers
in the ensemble.

This generator method yields the ensemble predicted class probabilities
after each iteration of boosting and therefore allows monitoring, such
as to determine the predicted class probabilities on a test set after
each boost.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples. Sparse matrix can be CSC, CSR, COO,
    DOK, or LIL. COO, DOK, and LIL are converted to CSR.

Yields
-------
p : generator of array, shape = [n_samples]
    The class probabilities of the input samples. The order of
    outputs is the same of that of the :term:`classes_` attribute.
*)

val staged_score : ?sample_weight:Ndarray.t -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> y:Ndarray.t -> t -> Py.Object.t
(**
Return staged scores for X, y.

This generator method yields the ensemble score after each iteration of
boosting and therefore allows monitoring, such as to determine the
score on a test set after each boost.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples. Sparse matrix can be CSC, CSR, COO,
    DOK, or LIL. COO, DOK, and LIL are converted to CSR.

y : array-like of shape (n_samples,)
    Labels for X.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights.

Yields
------
z : float
*)


(** Attribute base_estimator_: see constructor for documentation *)
val base_estimator_ : t -> Py.Object.t

(** Attribute estimators_: see constructor for documentation *)
val estimators_ : t -> Py.Object.t

(** Attribute classes_: see constructor for documentation *)
val classes_ : t -> Ndarray.t

(** Attribute n_classes_: see constructor for documentation *)
val n_classes_ : t -> int

(** Attribute estimator_weights_: see constructor for documentation *)
val estimator_weights_ : t -> Ndarray.t

(** Attribute estimator_errors_: see constructor for documentation *)
val estimator_errors_ : t -> Ndarray.t

(** Attribute feature_importances_: see constructor for documentation *)
val feature_importances_ : t -> Ndarray.t

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module AdaBoostRegressor : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?base_estimator:Py.Object.t -> ?n_estimators:int -> ?learning_rate:float -> ?loss:[`Linear | `Square | `Exponential] -> ?random_state:[`Int of int | `RandomState of Py.Object.t | `None] -> unit -> t
(**
An AdaBoost regressor.

An AdaBoost [1] regressor is a meta-estimator that begins by fitting a
regressor on the original dataset and then fits additional copies of the
regressor on the same dataset but where the weights of instances are
adjusted according to the error of the current prediction. As such,
subsequent regressors focus more on difficult cases.

This class implements the algorithm known as AdaBoost.R2 [2].

Read more in the :ref:`User Guide <adaboost>`.

.. versionadded:: 0.14

Parameters
----------
base_estimator : object, optional (default=None)
    The base estimator from which the boosted ensemble is built.
    If ``None``, then the base estimator is
    ``DecisionTreeRegressor(max_depth=3)``.

n_estimators : integer, optional (default=50)
    The maximum number of estimators at which boosting is terminated.
    In case of perfect fit, the learning procedure is stopped early.

learning_rate : float, optional (default=1.)
    Learning rate shrinks the contribution of each regressor by
    ``learning_rate``. There is a trade-off between ``learning_rate`` and
    ``n_estimators``.

loss : {'linear', 'square', 'exponential'}, optional (default='linear')
    The loss function to use when updating the weights after each
    boosting iteration.

random_state : int, RandomState instance or None, optional (default=None)
    If int, random_state is the seed used by the random number generator;
    If RandomState instance, random_state is the random number generator;
    If None, the random number generator is the RandomState instance used
    by `np.random`.

Attributes
----------
base_estimator_ : estimator
    The base estimator from which the ensemble is grown.

estimators_ : list of classifiers
    The collection of fitted sub-estimators.

estimator_weights_ : array of floats
    Weights for each estimator in the boosted ensemble.

estimator_errors_ : array of floats
    Regression error for each estimator in the boosted ensemble.

feature_importances_ : ndarray of shape (n_features,)
    The feature importances if supported by the ``base_estimator``.

Examples
--------
>>> from sklearn.ensemble import AdaBoostRegressor
>>> from sklearn.datasets import make_regression
>>> X, y = make_regression(n_features=4, n_informative=2,
...                        random_state=0, shuffle=False)
>>> regr = AdaBoostRegressor(random_state=0, n_estimators=100)
>>> regr.fit(X, y)
AdaBoostRegressor(n_estimators=100, random_state=0)
>>> regr.feature_importances_
array([0.2788..., 0.7109..., 0.0065..., 0.0036...])
>>> regr.predict([[0, 0, 0, 0]])
array([4.7972...])
>>> regr.score(X, y)
0.9771...

See also
--------
AdaBoostClassifier, GradientBoostingRegressor,
sklearn.tree.DecisionTreeRegressor

References
----------
.. [1] Y. Freund, R. Schapire, "A Decision-Theoretic Generalization of
       on-Line Learning and an Application to Boosting", 1995.

.. [2] H. Drucker, "Improving Regressors using Boosting Techniques", 1997.
*)

val get_item : index:Py.Object.t -> t -> Py.Object.t
(**
Return the index'th estimator in the ensemble.
*)

val fit : ?sample_weight:Ndarray.t -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> y:Ndarray.t -> t -> t
(**
Build a boosted regressor from the training set (X, y).

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples. Sparse matrix can be CSC, CSR, COO,
    DOK, or LIL. COO, DOK, and LIL are converted to CSR.

y : array-like of shape (n_samples,)
    The target values (real numbers).

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights. If None, the sample weights are initialized to
    1 / n_samples.

Returns
-------
self : object
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get parameters for this estimator.

Parameters
----------
deep : bool, default=True
    If True, will return the parameters for this estimator and
    contained subobjects that are estimators.

Returns
-------
params : mapping of string to any
    Parameter names mapped to their values.
*)

val predict : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict regression value for X.

The predicted regression value of an input sample is computed
as the weighted median prediction of the classifiers in the ensemble.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples. Sparse matrix can be CSC, CSR, COO,
    DOK, or LIL. COO, DOK, and LIL are converted to CSR.

Returns
-------
y : ndarray of shape (n_samples,)
    The predicted regression values.
*)

val score : ?sample_weight:Ndarray.t -> x:Ndarray.t -> y:Ndarray.t -> t -> float
(**
Return the coefficient of determination R^2 of the prediction.

The coefficient R^2 is defined as (1 - u/v), where u is the residual
sum of squares ((y_true - y_pred) ** 2).sum() and v is the total
sum of squares ((y_true - y_true.mean()) ** 2).sum().
The best possible score is 1.0 and it can be negative (because the
model can be arbitrarily worse). A constant model that always
predicts the expected value of y, disregarding the input features,
would get a R^2 score of 0.0.

Parameters
----------
X : array-like of shape (n_samples, n_features)
    Test samples. For some estimators this may be a
    precomputed kernel matrix or a list of generic objects instead,
    shape = (n_samples, n_samples_fitted),
    where n_samples_fitted is the number of
    samples used in the fitting for the estimator.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    True values for X.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights.

Returns
-------
score : float
    R^2 of self.predict(X) wrt. y.

Notes
-----
The R2 score used when calling ``score`` on a regressor will use
``multioutput='uniform_average'`` from version 0.23 to keep consistent
with :func:`~sklearn.metrics.r2_score`. This will influence the
``score`` method of all the multioutput regressors (except for
:class:`~sklearn.multioutput.MultiOutputRegressor`). To specify the
default value manually and avoid the warning, please either call
:func:`~sklearn.metrics.r2_score` directly or make a custom scorer with
:func:`~sklearn.metrics.make_scorer` (the built-in scorer ``'r2'`` uses
``multioutput='uniform_average'``).
*)

val set_params : ?params:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of this estimator.

The method works on simple estimators as well as on nested objects
(such as pipelines). The latter have parameters of the form
``<component>__<parameter>`` so that it's possible to update each
component of a nested object.

Parameters
----------
**params : dict
    Estimator parameters.

Returns
-------
self : object
    Estimator instance.
*)

val staged_predict : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Py.Object.t
(**
Return staged predictions for X.

The predicted regression value of an input sample is computed
as the weighted median prediction of the classifiers in the ensemble.

This generator method yields the ensemble prediction after each
iteration of boosting and therefore allows monitoring, such as to
determine the prediction on a test set after each boost.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples.

Yields
-------
y : generator of array, shape = [n_samples]
    The predicted regression values.
*)

val staged_score : ?sample_weight:Ndarray.t -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> y:Ndarray.t -> t -> Py.Object.t
(**
Return staged scores for X, y.

This generator method yields the ensemble score after each iteration of
boosting and therefore allows monitoring, such as to determine the
score on a test set after each boost.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples. Sparse matrix can be CSC, CSR, COO,
    DOK, or LIL. COO, DOK, and LIL are converted to CSR.

y : array-like of shape (n_samples,)
    Labels for X.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights.

Yields
------
z : float
*)


(** Attribute base_estimator_: see constructor for documentation *)
val base_estimator_ : t -> Py.Object.t

(** Attribute estimators_: see constructor for documentation *)
val estimators_ : t -> Py.Object.t

(** Attribute estimator_weights_: see constructor for documentation *)
val estimator_weights_ : t -> Ndarray.t

(** Attribute estimator_errors_: see constructor for documentation *)
val estimator_errors_ : t -> Ndarray.t

(** Attribute feature_importances_: see constructor for documentation *)
val feature_importances_ : t -> Ndarray.t

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module BaggingClassifier : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?base_estimator:[`None | `PyObject of Py.Object.t] -> ?n_estimators:int -> ?max_samples:[`Int of int | `Float of float] -> ?max_features:[`Int of int | `Float of float] -> ?bootstrap:bool -> ?bootstrap_features:bool -> ?oob_score:bool -> ?warm_start:bool -> ?n_jobs:[`Int of int | `None] -> ?random_state:[`Int of int | `RandomState of Py.Object.t | `None] -> ?verbose:int -> unit -> t
(**
A Bagging classifier.

A Bagging classifier is an ensemble meta-estimator that fits base
classifiers each on random subsets of the original dataset and then
aggregate their individual predictions (either by voting or by averaging)
to form a final prediction. Such a meta-estimator can typically be used as
a way to reduce the variance of a black-box estimator (e.g., a decision
tree), by introducing randomization into its construction procedure and
then making an ensemble out of it.

This algorithm encompasses several works from the literature. When random
subsets of the dataset are drawn as random subsets of the samples, then
this algorithm is known as Pasting [1]_. If samples are drawn with
replacement, then the method is known as Bagging [2]_. When random subsets
of the dataset are drawn as random subsets of the features, then the method
is known as Random Subspaces [3]_. Finally, when base estimators are built
on subsets of both samples and features, then the method is known as
Random Patches [4]_.

Read more in the :ref:`User Guide <bagging>`.

.. versionadded:: 0.15

Parameters
----------
base_estimator : object or None, optional (default=None)
    The base estimator to fit on random subsets of the dataset.
    If None, then the base estimator is a decision tree.

n_estimators : int, optional (default=10)
    The number of base estimators in the ensemble.

max_samples : int or float, optional (default=1.0)
    The number of samples to draw from X to train each base estimator.

    - If int, then draw `max_samples` samples.
    - If float, then draw `max_samples * X.shape[0]` samples.

max_features : int or float, optional (default=1.0)
    The number of features to draw from X to train each base estimator.

    - If int, then draw `max_features` features.
    - If float, then draw `max_features * X.shape[1]` features.

bootstrap : boolean, optional (default=True)
    Whether samples are drawn with replacement. If False, sampling
    without replacement is performed.

bootstrap_features : boolean, optional (default=False)
    Whether features are drawn with replacement.

oob_score : bool, optional (default=False)
    Whether to use out-of-bag samples to estimate
    the generalization error.

warm_start : bool, optional (default=False)
    When set to True, reuse the solution of the previous call to fit
    and add more estimators to the ensemble, otherwise, just fit
    a whole new ensemble. See :term:`the Glossary <warm_start>`.

    .. versionadded:: 0.17
       *warm_start* constructor parameter.

n_jobs : int or None, optional (default=None)
    The number of jobs to run in parallel for both :meth:`fit` and
    :meth:`predict`. ``None`` means 1 unless in a
    :obj:`joblib.parallel_backend` context. ``-1`` means using all
    processors. See :term:`Glossary <n_jobs>` for more details.

random_state : int, RandomState instance or None, optional (default=None)
    If int, random_state is the seed used by the random number generator;
    If RandomState instance, random_state is the random number generator;
    If None, the random number generator is the RandomState instance used
    by `np.random`.

verbose : int, optional (default=0)
    Controls the verbosity when fitting and predicting.

Attributes
----------
base_estimator_ : estimator
    The base estimator from which the ensemble is grown.

n_features_ : int
    The number of features when :meth:`fit` is performed.

estimators_ : list of estimators
    The collection of fitted base estimators.

estimators_samples_ : list of arrays
    The subset of drawn samples (i.e., the in-bag samples) for each base
    estimator. Each subset is defined by an array of the indices selected.

estimators_features_ : list of arrays
    The subset of drawn features for each base estimator.

classes_ : array of shape (n_classes,)
    The classes labels.

n_classes_ : int or list
    The number of classes.

oob_score_ : float
    Score of the training dataset obtained using an out-of-bag estimate.
    This attribute exists only when ``oob_score`` is True.

oob_decision_function_ : array of shape (n_samples, n_classes)
    Decision function computed with out-of-bag estimate on the training
    set. If n_estimators is small it might be possible that a data point
    was never left out during the bootstrap. In this case,
    `oob_decision_function_` might contain NaN. This attribute exists
    only when ``oob_score`` is True.

Examples
--------
>>> from sklearn.svm import SVC
>>> from sklearn.ensemble import BaggingClassifier
>>> from sklearn.datasets import make_classification
>>> X, y = make_classification(n_samples=100, n_features=4,
...                            n_informative=2, n_redundant=0,
...                            random_state=0, shuffle=False)
>>> clf = BaggingClassifier(base_estimator=SVC(),
...                         n_estimators=10, random_state=0).fit(X, y)
>>> clf.predict([[0, 0, 0, 0]])
array([1])

References
----------

.. [1] L. Breiman, "Pasting small votes for classification in large
       databases and on-line", Machine Learning, 36(1), 85-103, 1999.

.. [2] L. Breiman, "Bagging predictors", Machine Learning, 24(2), 123-140,
       1996.

.. [3] T. Ho, "The random subspace method for constructing decision
       forests", Pattern Analysis and Machine Intelligence, 20(8), 832-844,
       1998.

.. [4] G. Louppe and P. Geurts, "Ensembles on Random Patches", Machine
       Learning and Knowledge Discovery in Databases, 346-361, 2012.
*)

val get_item : index:Py.Object.t -> t -> Py.Object.t
(**
Return the index'th estimator in the ensemble.
*)

val fit : ?sample_weight:Ndarray.t -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> y:Ndarray.t -> t -> t
(**
Build a Bagging ensemble of estimators from the training
   set (X, y).

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples. Sparse matrices are accepted only if
    they are supported by the base estimator.

y : array-like of shape (n_samples,)
    The target values (class labels in classification, real numbers in
    regression).

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights. If None, then samples are equally weighted.
    Note that this is supported only if the base estimator supports
    sample weighting.

Returns
-------
self : object
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get parameters for this estimator.

Parameters
----------
deep : bool, default=True
    If True, will return the parameters for this estimator and
    contained subobjects that are estimators.

Returns
-------
params : mapping of string to any
    Parameter names mapped to their values.
*)

val predict : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict class for X.

The predicted class of an input sample is computed as the class with
the highest mean predicted probability. If base estimators do not
implement a ``predict_proba`` method, then it resorts to voting.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples. Sparse matrices are accepted only if
    they are supported by the base estimator.

Returns
-------
y : ndarray of shape (n_samples,)
    The predicted classes.
*)

val predict_log_proba : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict class log-probabilities for X.

The predicted class log-probabilities of an input sample is computed as
the log of the mean predicted class probabilities of the base
estimators in the ensemble.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples. Sparse matrices are accepted only if
    they are supported by the base estimator.

Returns
-------
p : array of shape (n_samples, n_classes)
    The class log-probabilities of the input samples. The order of the
    classes corresponds to that in the attribute :term:`classes_`.
*)

val predict_proba : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict class probabilities for X.

The predicted class probabilities of an input sample is computed as
the mean predicted class probabilities of the base estimators in the
ensemble. If base estimators do not implement a ``predict_proba``
method, then it resorts to voting and the predicted class probabilities
of an input sample represents the proportion of estimators predicting
each class.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples. Sparse matrices are accepted only if
    they are supported by the base estimator.

Returns
-------
p : array of shape (n_samples, n_classes)
    The class probabilities of the input samples. The order of the
    classes corresponds to that in the attribute :term:`classes_`.
*)

val score : ?sample_weight:Ndarray.t -> x:Ndarray.t -> y:Ndarray.t -> t -> float
(**
Return the mean accuracy on the given test data and labels.

In multi-label classification, this is the subset accuracy
which is a harsh metric since you require for each sample that
each label set be correctly predicted.

Parameters
----------
X : array-like of shape (n_samples, n_features)
    Test samples.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    True labels for X.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights.

Returns
-------
score : float
    Mean accuracy of self.predict(X) wrt. y.
*)

val set_params : ?params:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of this estimator.

The method works on simple estimators as well as on nested objects
(such as pipelines). The latter have parameters of the form
``<component>__<parameter>`` so that it's possible to update each
component of a nested object.

Parameters
----------
**params : dict
    Estimator parameters.

Returns
-------
self : object
    Estimator instance.
*)


(** Attribute base_estimator_: see constructor for documentation *)
val base_estimator_ : t -> Py.Object.t

(** Attribute n_features_: see constructor for documentation *)
val n_features_ : t -> int

(** Attribute estimators_: see constructor for documentation *)
val estimators_ : t -> Py.Object.t

(** Attribute estimators_samples_: see constructor for documentation *)
val estimators_samples_ : t -> Py.Object.t

(** Attribute estimators_features_: see constructor for documentation *)
val estimators_features_ : t -> Py.Object.t

(** Attribute classes_: see constructor for documentation *)
val classes_ : t -> Ndarray.t

(** Attribute n_classes_: see constructor for documentation *)
val n_classes_ : t -> Py.Object.t

(** Attribute oob_score_: see constructor for documentation *)
val oob_score_ : t -> float

(** Attribute oob_decision_function_: see constructor for documentation *)
val oob_decision_function_ : t -> Ndarray.t

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module BaggingRegressor : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?base_estimator:[`None | `PyObject of Py.Object.t] -> ?n_estimators:int -> ?max_samples:[`Int of int | `Float of float] -> ?max_features:[`Int of int | `Float of float] -> ?bootstrap:bool -> ?bootstrap_features:bool -> ?oob_score:bool -> ?warm_start:bool -> ?n_jobs:[`Int of int | `None] -> ?random_state:[`Int of int | `RandomState of Py.Object.t | `None] -> ?verbose:int -> unit -> t
(**
A Bagging regressor.

A Bagging regressor is an ensemble meta-estimator that fits base
regressors each on random subsets of the original dataset and then
aggregate their individual predictions (either by voting or by averaging)
to form a final prediction. Such a meta-estimator can typically be used as
a way to reduce the variance of a black-box estimator (e.g., a decision
tree), by introducing randomization into its construction procedure and
then making an ensemble out of it.

This algorithm encompasses several works from the literature. When random
subsets of the dataset are drawn as random subsets of the samples, then
this algorithm is known as Pasting [1]_. If samples are drawn with
replacement, then the method is known as Bagging [2]_. When random subsets
of the dataset are drawn as random subsets of the features, then the method
is known as Random Subspaces [3]_. Finally, when base estimators are built
on subsets of both samples and features, then the method is known as
Random Patches [4]_.

Read more in the :ref:`User Guide <bagging>`.

.. versionadded:: 0.15

Parameters
----------
base_estimator : object or None, optional (default=None)
    The base estimator to fit on random subsets of the dataset.
    If None, then the base estimator is a decision tree.

n_estimators : int, optional (default=10)
    The number of base estimators in the ensemble.

max_samples : int or float, optional (default=1.0)
    The number of samples to draw from X to train each base estimator.

    - If int, then draw `max_samples` samples.
    - If float, then draw `max_samples * X.shape[0]` samples.

max_features : int or float, optional (default=1.0)
    The number of features to draw from X to train each base estimator.

    - If int, then draw `max_features` features.
    - If float, then draw `max_features * X.shape[1]` features.

bootstrap : boolean, optional (default=True)
    Whether samples are drawn with replacement. If False, sampling
    without replacement is performed.

bootstrap_features : boolean, optional (default=False)
    Whether features are drawn with replacement.

oob_score : bool
    Whether to use out-of-bag samples to estimate
    the generalization error.

warm_start : bool, optional (default=False)
    When set to True, reuse the solution of the previous call to fit
    and add more estimators to the ensemble, otherwise, just fit
    a whole new ensemble. See :term:`the Glossary <warm_start>`.

n_jobs : int or None, optional (default=None)
    The number of jobs to run in parallel for both :meth:`fit` and
    :meth:`predict`. ``None`` means 1 unless in a
    :obj:`joblib.parallel_backend` context. ``-1`` means using all
    processors. See :term:`Glossary <n_jobs>` for more details.

random_state : int, RandomState instance or None, optional (default=None)
    If int, random_state is the seed used by the random number generator;
    If RandomState instance, random_state is the random number generator;
    If None, the random number generator is the RandomState instance used
    by `np.random`.

verbose : int, optional (default=0)
    Controls the verbosity when fitting and predicting.

Attributes
----------
base_estimator_ : estimator
    The base estimator from which the ensemble is grown.

n_features_ : int
    The number of features when :meth:`fit` is performed.

estimators_ : list of estimators
    The collection of fitted sub-estimators.

estimators_samples_ : list of arrays
    The subset of drawn samples (i.e., the in-bag samples) for each base
    estimator. Each subset is defined by an array of the indices selected.

estimators_features_ : list of arrays
    The subset of drawn features for each base estimator.

oob_score_ : float
    Score of the training dataset obtained using an out-of-bag estimate.
    This attribute exists only when ``oob_score`` is True.

oob_prediction_ : ndarray of shape (n_samples,)
    Prediction computed with out-of-bag estimate on the training
    set. If n_estimators is small it might be possible that a data point
    was never left out during the bootstrap. In this case,
    `oob_prediction_` might contain NaN. This attribute exists only
    when ``oob_score`` is True.

Examples
--------
>>> from sklearn.svm import SVR
>>> from sklearn.ensemble import BaggingRegressor
>>> from sklearn.datasets import make_regression
>>> X, y = make_regression(n_samples=100, n_features=4,
...                        n_informative=2, n_targets=1,
...                        random_state=0, shuffle=False)
>>> regr = BaggingRegressor(base_estimator=SVR(),
...                         n_estimators=10, random_state=0).fit(X, y)
>>> regr.predict([[0, 0, 0, 0]])
array([-2.8720...])

References
----------

.. [1] L. Breiman, "Pasting small votes for classification in large
       databases and on-line", Machine Learning, 36(1), 85-103, 1999.

.. [2] L. Breiman, "Bagging predictors", Machine Learning, 24(2), 123-140,
       1996.

.. [3] T. Ho, "The random subspace method for constructing decision
       forests", Pattern Analysis and Machine Intelligence, 20(8), 832-844,
       1998.

.. [4] G. Louppe and P. Geurts, "Ensembles on Random Patches", Machine
       Learning and Knowledge Discovery in Databases, 346-361, 2012.
*)

val get_item : index:Py.Object.t -> t -> Py.Object.t
(**
Return the index'th estimator in the ensemble.
*)

val fit : ?sample_weight:Ndarray.t -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> y:Ndarray.t -> t -> t
(**
Build a Bagging ensemble of estimators from the training
   set (X, y).

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples. Sparse matrices are accepted only if
    they are supported by the base estimator.

y : array-like of shape (n_samples,)
    The target values (class labels in classification, real numbers in
    regression).

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights. If None, then samples are equally weighted.
    Note that this is supported only if the base estimator supports
    sample weighting.

Returns
-------
self : object
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get parameters for this estimator.

Parameters
----------
deep : bool, default=True
    If True, will return the parameters for this estimator and
    contained subobjects that are estimators.

Returns
-------
params : mapping of string to any
    Parameter names mapped to their values.
*)

val predict : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict regression target for X.

The predicted regression target of an input sample is computed as the
mean predicted regression targets of the estimators in the ensemble.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The training input samples. Sparse matrices are accepted only if
    they are supported by the base estimator.

Returns
-------
y : ndarray of shape (n_samples,)
    The predicted values.
*)

val score : ?sample_weight:Ndarray.t -> x:Ndarray.t -> y:Ndarray.t -> t -> float
(**
Return the coefficient of determination R^2 of the prediction.

The coefficient R^2 is defined as (1 - u/v), where u is the residual
sum of squares ((y_true - y_pred) ** 2).sum() and v is the total
sum of squares ((y_true - y_true.mean()) ** 2).sum().
The best possible score is 1.0 and it can be negative (because the
model can be arbitrarily worse). A constant model that always
predicts the expected value of y, disregarding the input features,
would get a R^2 score of 0.0.

Parameters
----------
X : array-like of shape (n_samples, n_features)
    Test samples. For some estimators this may be a
    precomputed kernel matrix or a list of generic objects instead,
    shape = (n_samples, n_samples_fitted),
    where n_samples_fitted is the number of
    samples used in the fitting for the estimator.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    True values for X.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights.

Returns
-------
score : float
    R^2 of self.predict(X) wrt. y.

Notes
-----
The R2 score used when calling ``score`` on a regressor will use
``multioutput='uniform_average'`` from version 0.23 to keep consistent
with :func:`~sklearn.metrics.r2_score`. This will influence the
``score`` method of all the multioutput regressors (except for
:class:`~sklearn.multioutput.MultiOutputRegressor`). To specify the
default value manually and avoid the warning, please either call
:func:`~sklearn.metrics.r2_score` directly or make a custom scorer with
:func:`~sklearn.metrics.make_scorer` (the built-in scorer ``'r2'`` uses
``multioutput='uniform_average'``).
*)

val set_params : ?params:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of this estimator.

The method works on simple estimators as well as on nested objects
(such as pipelines). The latter have parameters of the form
``<component>__<parameter>`` so that it's possible to update each
component of a nested object.

Parameters
----------
**params : dict
    Estimator parameters.

Returns
-------
self : object
    Estimator instance.
*)


(** Attribute base_estimator_: see constructor for documentation *)
val base_estimator_ : t -> Py.Object.t

(** Attribute n_features_: see constructor for documentation *)
val n_features_ : t -> int

(** Attribute estimators_: see constructor for documentation *)
val estimators_ : t -> Py.Object.t

(** Attribute estimators_samples_: see constructor for documentation *)
val estimators_samples_ : t -> Py.Object.t

(** Attribute estimators_features_: see constructor for documentation *)
val estimators_features_ : t -> Py.Object.t

(** Attribute oob_score_: see constructor for documentation *)
val oob_score_ : t -> float

(** Attribute oob_prediction_: see constructor for documentation *)
val oob_prediction_ : t -> Ndarray.t

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module ExtraTreesClassifier : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?n_estimators:int -> ?criterion:string -> ?max_depth:[`Int of int | `None] -> ?min_samples_split:[`Int of int | `Float of float] -> ?min_samples_leaf:[`Int of int | `Float of float] -> ?min_weight_fraction_leaf:float -> ?max_features:[`Int of int | `Float of float | `String of string | `None] -> ?max_leaf_nodes:[`Int of int | `None] -> ?min_impurity_decrease:float -> ?min_impurity_split:float -> ?bootstrap:bool -> ?oob_score:bool -> ?n_jobs:[`Int of int | `None] -> ?random_state:[`Int of int | `RandomState of Py.Object.t | `None] -> ?verbose:int -> ?warm_start:bool -> ?class_weight:[`DictIntToFloat of (int * float) list | `Balanced | `Balanced_subsample | `None | `PyObject of Py.Object.t] -> ?ccp_alpha:float -> ?max_samples:[`Int of int | `Float of float] -> unit -> t
(**
An extra-trees classifier.

This class implements a meta estimator that fits a number of
randomized decision trees (a.k.a. extra-trees) on various sub-samples
of the dataset and uses averaging to improve the predictive accuracy
and control over-fitting.

Read more in the :ref:`User Guide <forest>`.

Parameters
----------
n_estimators : integer, optional (default=10)
    The number of trees in the forest.

    .. versionchanged:: 0.22
       The default value of ``n_estimators`` changed from 10 to 100
       in 0.22.

criterion : string, optional (default="gini")
    The function to measure the quality of a split. Supported criteria are
    "gini" for the Gini impurity and "entropy" for the information gain.

max_depth : integer or None, optional (default=None)
    The maximum depth of the tree. If None, then nodes are expanded until
    all leaves are pure or until all leaves contain less than
    min_samples_split samples.

min_samples_split : int, float, optional (default=2)
    The minimum number of samples required to split an internal node:

    - If int, then consider `min_samples_split` as the minimum number.
    - If float, then `min_samples_split` is a fraction and
      `ceil(min_samples_split * n_samples)` are the minimum
      number of samples for each split.

    .. versionchanged:: 0.18
       Added float values for fractions.

min_samples_leaf : int, float, optional (default=1)
    The minimum number of samples required to be at a leaf node.
    A split point at any depth will only be considered if it leaves at
    least ``min_samples_leaf`` training samples in each of the left and
    right branches.  This may have the effect of smoothing the model,
    especially in regression.

    - If int, then consider `min_samples_leaf` as the minimum number.
    - If float, then `min_samples_leaf` is a fraction and
      `ceil(min_samples_leaf * n_samples)` are the minimum
      number of samples for each node.

    .. versionchanged:: 0.18
       Added float values for fractions.

min_weight_fraction_leaf : float, optional (default=0.)
    The minimum weighted fraction of the sum total of weights (of all
    the input samples) required to be at a leaf node. Samples have
    equal weight when sample_weight is not provided.

max_features : int, float, string or None, optional (default="auto")
    The number of features to consider when looking for the best split:

    - If int, then consider `max_features` features at each split.
    - If float, then `max_features` is a fraction and
      `int(max_features * n_features)` features are considered at each
      split.
    - If "auto", then `max_features=sqrt(n_features)`.
    - If "sqrt", then `max_features=sqrt(n_features)`.
    - If "log2", then `max_features=log2(n_features)`.
    - If None, then `max_features=n_features`.

    Note: the search for a split does not stop until at least one
    valid partition of the node samples is found, even if it requires to
    effectively inspect more than ``max_features`` features.

max_leaf_nodes : int or None, optional (default=None)
    Grow trees with ``max_leaf_nodes`` in best-first fashion.
    Best nodes are defined as relative reduction in impurity.
    If None then unlimited number of leaf nodes.

min_impurity_decrease : float, optional (default=0.)
    A node will be split if this split induces a decrease of the impurity
    greater than or equal to this value.

    The weighted impurity decrease equation is the following::

        N_t / N * (impurity - N_t_R / N_t * right_impurity
                            - N_t_L / N_t * left_impurity)

    where ``N`` is the total number of samples, ``N_t`` is the number of
    samples at the current node, ``N_t_L`` is the number of samples in the
    left child, and ``N_t_R`` is the number of samples in the right child.

    ``N``, ``N_t``, ``N_t_R`` and ``N_t_L`` all refer to the weighted sum,
    if ``sample_weight`` is passed.

    .. versionadded:: 0.19

min_impurity_split : float, (default=1e-7)
    Threshold for early stopping in tree growth. A node will split
    if its impurity is above the threshold, otherwise it is a leaf.

    .. deprecated:: 0.19
       ``min_impurity_split`` has been deprecated in favor of
       ``min_impurity_decrease`` in 0.19. The default value of
       ``min_impurity_split`` will change from 1e-7 to 0 in 0.23 and it
       will be removed in 0.25. Use ``min_impurity_decrease`` instead.

bootstrap : boolean, optional (default=False)
    Whether bootstrap samples are used when building trees. If False, the
    whole dataset is used to build each tree.

oob_score : bool, optional (default=False)
    Whether to use out-of-bag samples to estimate
    the generalization accuracy.

n_jobs : int or None, optional (default=None)
    The number of jobs to run in parallel. :meth:`fit`, :meth:`predict`,
    :meth:`decision_path` and :meth:`apply` are all parallelized over the
    trees. ``None`` means 1 unless in a :obj:`joblib.parallel_backend`
    context. ``-1`` means using all processors. See :term:`Glossary
    <n_jobs>` for more details.

random_state : int, RandomState instance or None, optional (default=None)
    Controls 3 sources of randomness:

    - the bootstrapping of the samples used when building trees
      (if ``bootstrap=True``)
    - the sampling of the features to consider when looking for the best
      split at each node (if ``max_features < n_features``)
    - the draw of the splits for each of the `max_features`

    See :term:`Glossary <random_state>` for details.

verbose : int, optional (default=0)
    Controls the verbosity when fitting and predicting.

warm_start : bool, optional (default=False)
    When set to ``True``, reuse the solution of the previous call to fit
    and add more estimators to the ensemble, otherwise, just fit a whole
    new forest. See :term:`the Glossary <warm_start>`.

class_weight : dict, list of dicts, "balanced", "balanced_subsample" or     None, optional (default=None)
    Weights associated with classes in the form ``{class_label: weight}``.
    If not given, all classes are supposed to have weight one. For
    multi-output problems, a list of dicts can be provided in the same
    order as the columns of y.

    Note that for multioutput (including multilabel) weights should be
    defined for each class of every column in its own dict. For example,
    for four-class multilabel classification weights should be
    [{0: 1, 1: 1}, {0: 1, 1: 5}, {0: 1, 1: 1}, {0: 1, 1: 1}] instead of
    [{1:1}, {2:5}, {3:1}, {4:1}].

    The "balanced" mode uses the values of y to automatically adjust
    weights inversely proportional to class frequencies in the input data
    as ``n_samples / (n_classes * np.bincount(y))``

    The "balanced_subsample" mode is the same as "balanced" except that
    weights are computed based on the bootstrap sample for every tree
    grown.

    For multi-output, the weights of each column of y will be multiplied.

    Note that these weights will be multiplied with sample_weight (passed
    through the fit method) if sample_weight is specified.

ccp_alpha : non-negative float, optional (default=0.0)
    Complexity parameter used for Minimal Cost-Complexity Pruning. The
    subtree with the largest cost complexity that is smaller than
    ``ccp_alpha`` will be chosen. By default, no pruning is performed. See
    :ref:`minimal_cost_complexity_pruning` for details.

    .. versionadded:: 0.22

max_samples : int or float, default=None
    If bootstrap is True, the number of samples to draw from X
    to train each base estimator.

    - If None (default), then draw `X.shape[0]` samples.
    - If int, then draw `max_samples` samples.
    - If float, then draw `max_samples * X.shape[0]` samples. Thus,
      `max_samples` should be in the interval `(0, 1)`.

    .. versionadded:: 0.22

Attributes
----------
base_estimator_ : ExtraTreeClassifier
    The child estimator template used to create the collection of fitted
    sub-estimators.

estimators_ : list of DecisionTreeClassifier
    The collection of fitted sub-estimators.

classes_ : array of shape (n_classes,) or a list of such arrays
    The classes labels (single output problem), or a list of arrays of
    class labels (multi-output problem).

n_classes_ : int or list
    The number of classes (single output problem), or a list containing the
    number of classes for each output (multi-output problem).

feature_importances_ : ndarray of shape (n_features,)
    The feature importances (the higher, the more important the feature).

n_features_ : int
    The number of features when ``fit`` is performed.

n_outputs_ : int
    The number of outputs when ``fit`` is performed.

oob_score_ : float
    Score of the training dataset obtained using an out-of-bag estimate.
    This attribute exists only when ``oob_score`` is True.

oob_decision_function_ : array of shape (n_samples, n_classes)
    Decision function computed with out-of-bag estimate on the training
    set. If n_estimators is small it might be possible that a data point
    was never left out during the bootstrap. In this case,
    `oob_decision_function_` might contain NaN. This attribute exists
    only when ``oob_score`` is True.

Notes
-----
The default values for the parameters controlling the size of the trees
(e.g. ``max_depth``, ``min_samples_leaf``, etc.) lead to fully grown and
unpruned trees which can potentially be very large on some data sets. To
reduce memory consumption, the complexity and size of the trees should be
controlled by setting those parameter values.

Examples
--------
>>> from sklearn.ensemble import ExtraTreesClassifier
>>> from sklearn.datasets import make_classification
>>> X, y = make_classification(n_features=4, random_state=0)
>>> clf = ExtraTreesClassifier(n_estimators=100, random_state=0)
>>> clf.fit(X, y)
ExtraTreesClassifier(random_state=0)
>>> clf.predict([[0, 0, 0, 0]])
array([1])

References
----------

.. [1] P. Geurts, D. Ernst., and L. Wehenkel, "Extremely randomized
       trees", Machine Learning, 63(1), 3-42, 2006.

See Also
--------
sklearn.tree.ExtraTreeClassifier : Base classifier for this ensemble.
RandomForestClassifier : Ensemble Classifier based on trees with optimal
    splits.
*)

val get_item : index:Py.Object.t -> t -> Py.Object.t
(**
Return the index'th estimator in the ensemble.
*)

val apply : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Apply trees in the forest to X, return leaf indices.

Parameters
----------
X : {array-like or sparse matrix} of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
X_leaves : array_like, shape = [n_samples, n_estimators]
    For each datapoint x in X and for each tree in the forest,
    return the index of the leaf x ends up in.
*)

val decision_path : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> (Py.Object.t * Py.Object.t)
(**
Return the decision path in the forest.

.. versionadded:: 0.18

Parameters
----------
X : {array-like or sparse matrix} of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
indicator : sparse csr array, shape = [n_samples, n_nodes]
    Return a node indicator matrix where non zero elements
    indicates that the samples goes through the nodes.

n_nodes_ptr : array of size (n_estimators + 1, )
    The columns from indicator[n_nodes_ptr[i]:n_nodes_ptr[i+1]]
    gives the indicator value for the i-th estimator.
*)

val fit : ?sample_weight:Ndarray.t -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> y:Ndarray.t -> t -> t
(**
Build a forest of trees from the training set (X, y).

Parameters
----------
X : array-like or sparse matrix of shape (n_samples, n_features)
    The training input samples. Internally, its dtype will be converted
    to ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csc_matrix``.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    The target values (class labels in classification, real numbers in
    regression).

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights. If None, then samples are equally weighted. Splits
    that would create child nodes with net zero or negative weight are
    ignored while searching for a split in each node. In the case of
    classification, splits are also ignored if they would result in any
    single class carrying a negative weight in either child node.

Returns
-------
self : object
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get parameters for this estimator.

Parameters
----------
deep : bool, default=True
    If True, will return the parameters for this estimator and
    contained subobjects that are estimators.

Returns
-------
params : mapping of string to any
    Parameter names mapped to their values.
*)

val predict : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict class for X.

The predicted class of an input sample is a vote by the trees in
the forest, weighted by their probability estimates. That is,
the predicted class is the one with highest mean probability
estimate across the trees.

Parameters
----------
X : array-like or sparse matrix of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    The predicted classes.
*)

val predict_log_proba : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Py.Object.t
(**
Predict class log-probabilities for X.

The predicted class log-probabilities of an input sample is computed as
the log of the mean predicted class probabilities of the trees in the
forest.

Parameters
----------
X : array-like or sparse matrix of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
p : array of shape (n_samples, n_classes), or a list of n_outputs
    such arrays if n_outputs > 1.
    The class probabilities of the input samples. The order of the
    classes corresponds to that in the attribute :term:`classes_`.
*)

val predict_proba : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict class probabilities for X.

The predicted class probabilities of an input sample are computed as
the mean predicted class probabilities of the trees in the forest.
The class probability of a single tree is the fraction of samples of
the same class in a leaf.

Parameters
----------
X : array-like or sparse matrix of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
p : array of shape (n_samples, n_classes), or a list of n_outputs
    such arrays if n_outputs > 1.
    The class probabilities of the input samples. The order of the
    classes corresponds to that in the attribute :term:`classes_`.
*)

val score : ?sample_weight:Ndarray.t -> x:Ndarray.t -> y:Ndarray.t -> t -> float
(**
Return the mean accuracy on the given test data and labels.

In multi-label classification, this is the subset accuracy
which is a harsh metric since you require for each sample that
each label set be correctly predicted.

Parameters
----------
X : array-like of shape (n_samples, n_features)
    Test samples.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    True labels for X.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights.

Returns
-------
score : float
    Mean accuracy of self.predict(X) wrt. y.
*)

val set_params : ?params:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of this estimator.

The method works on simple estimators as well as on nested objects
(such as pipelines). The latter have parameters of the form
``<component>__<parameter>`` so that it's possible to update each
component of a nested object.

Parameters
----------
**params : dict
    Estimator parameters.

Returns
-------
self : object
    Estimator instance.
*)


(** Attribute base_estimator_: see constructor for documentation *)
val base_estimator_ : t -> Py.Object.t

(** Attribute estimators_: see constructor for documentation *)
val estimators_ : t -> Py.Object.t

(** Attribute classes_: see constructor for documentation *)
val classes_ : t -> Ndarray.t

(** Attribute n_classes_: see constructor for documentation *)
val n_classes_ : t -> Py.Object.t

(** Attribute feature_importances_: see constructor for documentation *)
val feature_importances_ : t -> Ndarray.t

(** Attribute n_features_: see constructor for documentation *)
val n_features_ : t -> int

(** Attribute n_outputs_: see constructor for documentation *)
val n_outputs_ : t -> int

(** Attribute oob_score_: see constructor for documentation *)
val oob_score_ : t -> float

(** Attribute oob_decision_function_: see constructor for documentation *)
val oob_decision_function_ : t -> Ndarray.t

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module ExtraTreesRegressor : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?n_estimators:int -> ?criterion:string -> ?max_depth:[`Int of int | `None] -> ?min_samples_split:[`Int of int | `Float of float] -> ?min_samples_leaf:[`Int of int | `Float of float] -> ?min_weight_fraction_leaf:float -> ?max_features:[`Int of int | `Float of float | `String of string | `None] -> ?max_leaf_nodes:[`Int of int | `None] -> ?min_impurity_decrease:float -> ?min_impurity_split:float -> ?bootstrap:bool -> ?oob_score:bool -> ?n_jobs:[`Int of int | `None] -> ?random_state:[`Int of int | `RandomState of Py.Object.t | `None] -> ?verbose:int -> ?warm_start:bool -> ?ccp_alpha:float -> ?max_samples:[`Int of int | `Float of float] -> unit -> t
(**
An extra-trees regressor.

This class implements a meta estimator that fits a number of
randomized decision trees (a.k.a. extra-trees) on various sub-samples
of the dataset and uses averaging to improve the predictive accuracy
and control over-fitting.

Read more in the :ref:`User Guide <forest>`.

Parameters
----------
n_estimators : integer, optional (default=10)
    The number of trees in the forest.

    .. versionchanged:: 0.22
       The default value of ``n_estimators`` changed from 10 to 100
       in 0.22.

criterion : string, optional (default="mse")
    The function to measure the quality of a split. Supported criteria
    are "mse" for the mean squared error, which is equal to variance
    reduction as feature selection criterion, and "mae" for the mean
    absolute error.

    .. versionadded:: 0.18
       Mean Absolute Error (MAE) criterion.

max_depth : integer or None, optional (default=None)
    The maximum depth of the tree. If None, then nodes are expanded until
    all leaves are pure or until all leaves contain less than
    min_samples_split samples.

min_samples_split : int, float, optional (default=2)
    The minimum number of samples required to split an internal node:

    - If int, then consider `min_samples_split` as the minimum number.
    - If float, then `min_samples_split` is a fraction and
      `ceil(min_samples_split * n_samples)` are the minimum
      number of samples for each split.

    .. versionchanged:: 0.18
       Added float values for fractions.

min_samples_leaf : int, float, optional (default=1)
    The minimum number of samples required to be at a leaf node.
    A split point at any depth will only be considered if it leaves at
    least ``min_samples_leaf`` training samples in each of the left and
    right branches.  This may have the effect of smoothing the model,
    especially in regression.

    - If int, then consider `min_samples_leaf` as the minimum number.
    - If float, then `min_samples_leaf` is a fraction and
      `ceil(min_samples_leaf * n_samples)` are the minimum
      number of samples for each node.

    .. versionchanged:: 0.18
       Added float values for fractions.

min_weight_fraction_leaf : float, optional (default=0.)
    The minimum weighted fraction of the sum total of weights (of all
    the input samples) required to be at a leaf node. Samples have
    equal weight when sample_weight is not provided.

max_features : int, float, string or None, optional (default="auto")
    The number of features to consider when looking for the best split:

    - If int, then consider `max_features` features at each split.
    - If float, then `max_features` is a fraction and
      `int(max_features * n_features)` features are considered at each
      split.
    - If "auto", then `max_features=n_features`.
    - If "sqrt", then `max_features=sqrt(n_features)`.
    - If "log2", then `max_features=log2(n_features)`.
    - If None, then `max_features=n_features`.

    Note: the search for a split does not stop until at least one
    valid partition of the node samples is found, even if it requires to
    effectively inspect more than ``max_features`` features.

max_leaf_nodes : int or None, optional (default=None)
    Grow trees with ``max_leaf_nodes`` in best-first fashion.
    Best nodes are defined as relative reduction in impurity.
    If None then unlimited number of leaf nodes.

min_impurity_decrease : float, optional (default=0.)
    A node will be split if this split induces a decrease of the impurity
    greater than or equal to this value.

    The weighted impurity decrease equation is the following::

        N_t / N * (impurity - N_t_R / N_t * right_impurity
                            - N_t_L / N_t * left_impurity)

    where ``N`` is the total number of samples, ``N_t`` is the number of
    samples at the current node, ``N_t_L`` is the number of samples in the
    left child, and ``N_t_R`` is the number of samples in the right child.

    ``N``, ``N_t``, ``N_t_R`` and ``N_t_L`` all refer to the weighted sum,
    if ``sample_weight`` is passed.

    .. versionadded:: 0.19

min_impurity_split : float, (default=1e-7)
    Threshold for early stopping in tree growth. A node will split
    if its impurity is above the threshold, otherwise it is a leaf.

    .. deprecated:: 0.19
       ``min_impurity_split`` has been deprecated in favor of
       ``min_impurity_decrease`` in 0.19. The default value of
       ``min_impurity_split`` will change from 1e-7 to 0 in 0.23 and it
       will be removed in 0.25. Use ``min_impurity_decrease`` instead.

bootstrap : boolean, optional (default=False)
    Whether bootstrap samples are used when building trees. If False, the
    whole dataset is used to build each tree.

oob_score : bool, optional (default=False)
    Whether to use out-of-bag samples to estimate the R^2 on unseen data.

n_jobs : int or None, optional (default=None)
    The number of jobs to run in parallel. :meth:`fit`, :meth:`predict`,
    :meth:`decision_path` and :meth:`apply` are all parallelized over the
    trees. ``None`` means 1 unless in a :obj:`joblib.parallel_backend`
    context. ``-1`` means using all processors. See :term:`Glossary
    <n_jobs>` for more details.

random_state : int, RandomState instance or None, optional (default=None)
    Controls 3 sources of randomness:

    - the bootstrapping of the samples used when building trees
      (if ``bootstrap=True``)
    - the sampling of the features to consider when looking for the best
      split at each node (if ``max_features < n_features``)
    - the draw of the splits for each of the `max_features`

    See :term:`Glossary <random_state>` for details.

verbose : int, optional (default=0)
    Controls the verbosity when fitting and predicting.

warm_start : bool, optional (default=False)
    When set to ``True``, reuse the solution of the previous call to fit
    and add more estimators to the ensemble, otherwise, just fit a whole
    new forest. See :term:`the Glossary <warm_start>`.

ccp_alpha : non-negative float, optional (default=0.0)
    Complexity parameter used for Minimal Cost-Complexity Pruning. The
    subtree with the largest cost complexity that is smaller than
    ``ccp_alpha`` will be chosen. By default, no pruning is performed. See
    :ref:`minimal_cost_complexity_pruning` for details.

    .. versionadded:: 0.22

max_samples : int or float, default=None
    If bootstrap is True, the number of samples to draw from X
    to train each base estimator.

    - If None (default), then draw `X.shape[0]` samples.
    - If int, then draw `max_samples` samples.
    - If float, then draw `max_samples * X.shape[0]` samples. Thus,
      `max_samples` should be in the interval `(0, 1)`.

    .. versionadded:: 0.22

Attributes
----------
base_estimator_ : ExtraTreeRegressor
    The child estimator template used to create the collection of fitted
    sub-estimators.

estimators_ : list of DecisionTreeRegressor
    The collection of fitted sub-estimators.

feature_importances_ : ndarray of shape (n_features,)
    The feature importances (the higher, the more important the feature).

n_features_ : int
    The number of features.

n_outputs_ : int
    The number of outputs.

oob_score_ : float
    Score of the training dataset obtained using an out-of-bag estimate.
    This attribute exists only when ``oob_score`` is True.

oob_prediction_ : ndarray of shape (n_samples,)
    Prediction computed with out-of-bag estimate on the training set.
    This attribute exists only when ``oob_score`` is True.

Notes
-----
The default values for the parameters controlling the size of the trees
(e.g. ``max_depth``, ``min_samples_leaf``, etc.) lead to fully grown and
unpruned trees which can potentially be very large on some data sets. To
reduce memory consumption, the complexity and size of the trees should be
controlled by setting those parameter values.

References
----------

.. [1] P. Geurts, D. Ernst., and L. Wehenkel, "Extremely randomized trees",
       Machine Learning, 63(1), 3-42, 2006.

See Also
--------
sklearn.tree.ExtraTreeRegressor: Base estimator for this ensemble.
RandomForestRegressor: Ensemble regressor using trees with optimal splits.
*)

val get_item : index:Py.Object.t -> t -> Py.Object.t
(**
Return the index'th estimator in the ensemble.
*)

val apply : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Apply trees in the forest to X, return leaf indices.

Parameters
----------
X : {array-like or sparse matrix} of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
X_leaves : array_like, shape = [n_samples, n_estimators]
    For each datapoint x in X and for each tree in the forest,
    return the index of the leaf x ends up in.
*)

val decision_path : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> (Py.Object.t * Py.Object.t)
(**
Return the decision path in the forest.

.. versionadded:: 0.18

Parameters
----------
X : {array-like or sparse matrix} of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
indicator : sparse csr array, shape = [n_samples, n_nodes]
    Return a node indicator matrix where non zero elements
    indicates that the samples goes through the nodes.

n_nodes_ptr : array of size (n_estimators + 1, )
    The columns from indicator[n_nodes_ptr[i]:n_nodes_ptr[i+1]]
    gives the indicator value for the i-th estimator.
*)

val fit : ?sample_weight:Ndarray.t -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> y:Ndarray.t -> t -> t
(**
Build a forest of trees from the training set (X, y).

Parameters
----------
X : array-like or sparse matrix of shape (n_samples, n_features)
    The training input samples. Internally, its dtype will be converted
    to ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csc_matrix``.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    The target values (class labels in classification, real numbers in
    regression).

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights. If None, then samples are equally weighted. Splits
    that would create child nodes with net zero or negative weight are
    ignored while searching for a split in each node. In the case of
    classification, splits are also ignored if they would result in any
    single class carrying a negative weight in either child node.

Returns
-------
self : object
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get parameters for this estimator.

Parameters
----------
deep : bool, default=True
    If True, will return the parameters for this estimator and
    contained subobjects that are estimators.

Returns
-------
params : mapping of string to any
    Parameter names mapped to their values.
*)

val predict : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict regression target for X.

The predicted regression target of an input sample is computed as the
mean predicted regression targets of the trees in the forest.

Parameters
----------
X : array-like or sparse matrix of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    The predicted values.
*)

val score : ?sample_weight:Ndarray.t -> x:Ndarray.t -> y:Ndarray.t -> t -> float
(**
Return the coefficient of determination R^2 of the prediction.

The coefficient R^2 is defined as (1 - u/v), where u is the residual
sum of squares ((y_true - y_pred) ** 2).sum() and v is the total
sum of squares ((y_true - y_true.mean()) ** 2).sum().
The best possible score is 1.0 and it can be negative (because the
model can be arbitrarily worse). A constant model that always
predicts the expected value of y, disregarding the input features,
would get a R^2 score of 0.0.

Parameters
----------
X : array-like of shape (n_samples, n_features)
    Test samples. For some estimators this may be a
    precomputed kernel matrix or a list of generic objects instead,
    shape = (n_samples, n_samples_fitted),
    where n_samples_fitted is the number of
    samples used in the fitting for the estimator.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    True values for X.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights.

Returns
-------
score : float
    R^2 of self.predict(X) wrt. y.

Notes
-----
The R2 score used when calling ``score`` on a regressor will use
``multioutput='uniform_average'`` from version 0.23 to keep consistent
with :func:`~sklearn.metrics.r2_score`. This will influence the
``score`` method of all the multioutput regressors (except for
:class:`~sklearn.multioutput.MultiOutputRegressor`). To specify the
default value manually and avoid the warning, please either call
:func:`~sklearn.metrics.r2_score` directly or make a custom scorer with
:func:`~sklearn.metrics.make_scorer` (the built-in scorer ``'r2'`` uses
``multioutput='uniform_average'``).
*)

val set_params : ?params:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of this estimator.

The method works on simple estimators as well as on nested objects
(such as pipelines). The latter have parameters of the form
``<component>__<parameter>`` so that it's possible to update each
component of a nested object.

Parameters
----------
**params : dict
    Estimator parameters.

Returns
-------
self : object
    Estimator instance.
*)


(** Attribute base_estimator_: see constructor for documentation *)
val base_estimator_ : t -> Py.Object.t

(** Attribute estimators_: see constructor for documentation *)
val estimators_ : t -> Py.Object.t

(** Attribute feature_importances_: see constructor for documentation *)
val feature_importances_ : t -> Ndarray.t

(** Attribute n_features_: see constructor for documentation *)
val n_features_ : t -> int

(** Attribute n_outputs_: see constructor for documentation *)
val n_outputs_ : t -> int

(** Attribute oob_score_: see constructor for documentation *)
val oob_score_ : t -> float

(** Attribute oob_prediction_: see constructor for documentation *)
val oob_prediction_ : t -> Ndarray.t

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module GradientBoostingClassifier : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?loss:[`Deviance | `Exponential] -> ?learning_rate:float -> ?n_estimators:int -> ?subsample:float -> ?criterion:string -> ?min_samples_split:[`Int of int | `Float of float] -> ?min_samples_leaf:[`Int of int | `Float of float] -> ?min_weight_fraction_leaf:float -> ?max_depth:int -> ?min_impurity_decrease:float -> ?min_impurity_split:float -> ?init:[`Estimator of Py.Object.t | `Zero] -> ?random_state:[`Int of int | `RandomState of Py.Object.t | `None] -> ?max_features:[`Int of int | `Float of float | `String of string | `None] -> ?verbose:int -> ?max_leaf_nodes:[`Int of int | `None] -> ?warm_start:bool -> ?presort:Py.Object.t -> ?validation_fraction:float -> ?n_iter_no_change:int -> ?tol:float -> ?ccp_alpha:float -> unit -> t
(**
Gradient Boosting for classification.

GB builds an additive model in a
forward stage-wise fashion; it allows for the optimization of
arbitrary differentiable loss functions. In each stage ``n_classes_``
regression trees are fit on the negative gradient of the
binomial or multinomial deviance loss function. Binary classification
is a special case where only a single regression tree is induced.

Read more in the :ref:`User Guide <gradient_boosting>`.

Parameters
----------
loss : {'deviance', 'exponential'}, optional (default='deviance')
    loss function to be optimized. 'deviance' refers to
    deviance (= logistic regression) for classification
    with probabilistic outputs. For loss 'exponential' gradient
    boosting recovers the AdaBoost algorithm.

learning_rate : float, optional (default=0.1)
    learning rate shrinks the contribution of each tree by `learning_rate`.
    There is a trade-off between learning_rate and n_estimators.

n_estimators : int (default=100)
    The number of boosting stages to perform. Gradient boosting
    is fairly robust to over-fitting so a large number usually
    results in better performance.

subsample : float, optional (default=1.0)
    The fraction of samples to be used for fitting the individual base
    learners. If smaller than 1.0 this results in Stochastic Gradient
    Boosting. `subsample` interacts with the parameter `n_estimators`.
    Choosing `subsample < 1.0` leads to a reduction of variance
    and an increase in bias.

criterion : string, optional (default="friedman_mse")
    The function to measure the quality of a split. Supported criteria
    are "friedman_mse" for the mean squared error with improvement
    score by Friedman, "mse" for mean squared error, and "mae" for
    the mean absolute error. The default value of "friedman_mse" is
    generally the best as it can provide a better approximation in
    some cases.

    .. versionadded:: 0.18

min_samples_split : int, float, optional (default=2)
    The minimum number of samples required to split an internal node:

    - If int, then consider `min_samples_split` as the minimum number.
    - If float, then `min_samples_split` is a fraction and
      `ceil(min_samples_split * n_samples)` are the minimum
      number of samples for each split.

    .. versionchanged:: 0.18
       Added float values for fractions.

min_samples_leaf : int, float, optional (default=1)
    The minimum number of samples required to be at a leaf node.
    A split point at any depth will only be considered if it leaves at
    least ``min_samples_leaf`` training samples in each of the left and
    right branches.  This may have the effect of smoothing the model,
    especially in regression.

    - If int, then consider `min_samples_leaf` as the minimum number.
    - If float, then `min_samples_leaf` is a fraction and
      `ceil(min_samples_leaf * n_samples)` are the minimum
      number of samples for each node.

    .. versionchanged:: 0.18
       Added float values for fractions.

min_weight_fraction_leaf : float, optional (default=0.)
    The minimum weighted fraction of the sum total of weights (of all
    the input samples) required to be at a leaf node. Samples have
    equal weight when sample_weight is not provided.

max_depth : integer, optional (default=3)
    maximum depth of the individual regression estimators. The maximum
    depth limits the number of nodes in the tree. Tune this parameter
    for best performance; the best value depends on the interaction
    of the input variables.

min_impurity_decrease : float, optional (default=0.)
    A node will be split if this split induces a decrease of the impurity
    greater than or equal to this value.

    The weighted impurity decrease equation is the following::

        N_t / N * (impurity - N_t_R / N_t * right_impurity
                            - N_t_L / N_t * left_impurity)

    where ``N`` is the total number of samples, ``N_t`` is the number of
    samples at the current node, ``N_t_L`` is the number of samples in the
    left child, and ``N_t_R`` is the number of samples in the right child.

    ``N``, ``N_t``, ``N_t_R`` and ``N_t_L`` all refer to the weighted sum,
    if ``sample_weight`` is passed.

    .. versionadded:: 0.19

min_impurity_split : float, (default=1e-7)
    Threshold for early stopping in tree growth. A node will split
    if its impurity is above the threshold, otherwise it is a leaf.

    .. deprecated:: 0.19
       ``min_impurity_split`` has been deprecated in favor of
       ``min_impurity_decrease`` in 0.19. The default value of
       ``min_impurity_split`` will change from 1e-7 to 0 in 0.23 and it
       will be removed in 0.25. Use ``min_impurity_decrease`` instead.

init : estimator or 'zero', optional (default=None)
    An estimator object that is used to compute the initial predictions.
    ``init`` has to provide :meth:`fit` and :meth:`predict_proba`. If
    'zero', the initial raw predictions are set to zero. By default, a
    ``DummyEstimator`` predicting the classes priors is used.

random_state : int, RandomState instance or None, optional (default=None)
    If int, random_state is the seed used by the random number generator;
    If RandomState instance, random_state is the random number generator;
    If None, the random number generator is the RandomState instance used
    by `np.random`.

max_features : int, float, string or None, optional (default=None)
    The number of features to consider when looking for the best split:

    - If int, then consider `max_features` features at each split.
    - If float, then `max_features` is a fraction and
      `int(max_features * n_features)` features are considered at each
      split.
    - If "auto", then `max_features=sqrt(n_features)`.
    - If "sqrt", then `max_features=sqrt(n_features)`.
    - If "log2", then `max_features=log2(n_features)`.
    - If None, then `max_features=n_features`.

    Choosing `max_features < n_features` leads to a reduction of variance
    and an increase in bias.

    Note: the search for a split does not stop until at least one
    valid partition of the node samples is found, even if it requires to
    effectively inspect more than ``max_features`` features.

verbose : int, default: 0
    Enable verbose output. If 1 then it prints progress and performance
    once in a while (the more trees the lower the frequency). If greater
    than 1 then it prints progress and performance for every tree.

max_leaf_nodes : int or None, optional (default=None)
    Grow trees with ``max_leaf_nodes`` in best-first fashion.
    Best nodes are defined as relative reduction in impurity.
    If None then unlimited number of leaf nodes.

warm_start : bool, default: False
    When set to ``True``, reuse the solution of the previous call to fit
    and add more estimators to the ensemble, otherwise, just erase the
    previous solution. See :term:`the Glossary <warm_start>`.

presort : deprecated, default='deprecated'
    This parameter is deprecated and will be removed in v0.24.

    .. deprecated :: 0.22

validation_fraction : float, optional, default 0.1
    The proportion of training data to set aside as validation set for
    early stopping. Must be between 0 and 1.
    Only used if ``n_iter_no_change`` is set to an integer.

    .. versionadded:: 0.20

n_iter_no_change : int, default None
    ``n_iter_no_change`` is used to decide if early stopping will be used
    to terminate training when validation score is not improving. By
    default it is set to None to disable early stopping. If set to a
    number, it will set aside ``validation_fraction`` size of the training
    data as validation and terminate training when validation score is not
    improving in all of the previous ``n_iter_no_change`` numbers of
    iterations. The split is stratified.

    .. versionadded:: 0.20

tol : float, optional, default 1e-4
    Tolerance for the early stopping. When the loss is not improving
    by at least tol for ``n_iter_no_change`` iterations (if set to a
    number), the training stops.

    .. versionadded:: 0.20

ccp_alpha : non-negative float, optional (default=0.0)
    Complexity parameter used for Minimal Cost-Complexity Pruning. The
    subtree with the largest cost complexity that is smaller than
    ``ccp_alpha`` will be chosen. By default, no pruning is performed. See
    :ref:`minimal_cost_complexity_pruning` for details.

    .. versionadded:: 0.22

Attributes
----------
n_estimators_ : int
    The number of estimators as selected by early stopping (if
    ``n_iter_no_change`` is specified). Otherwise it is set to
    ``n_estimators``.

    .. versionadded:: 0.20

feature_importances_ : array, shape (n_features,)
    The feature importances (the higher, the more important the feature).

oob_improvement_ : array, shape (n_estimators,)
    The improvement in loss (= deviance) on the out-of-bag samples
    relative to the previous iteration.
    ``oob_improvement_[0]`` is the improvement in
    loss of the first stage over the ``init`` estimator.
    Only available if ``subsample < 1.0``

train_score_ : array, shape (n_estimators,)
    The i-th score ``train_score_[i]`` is the deviance (= loss) of the
    model at iteration ``i`` on the in-bag sample.
    If ``subsample == 1`` this is the deviance on the training data.

loss_ : LossFunction
    The concrete ``LossFunction`` object.

init_ : estimator
    The estimator that provides the initial predictions.
    Set via the ``init`` argument or ``loss.init_estimator``.

estimators_ : ndarray of DecisionTreeRegressor,shape (n_estimators, ``loss_.K``)
    The collection of fitted sub-estimators. ``loss_.K`` is 1 for binary
    classification, otherwise n_classes.

classes_ : array of shape (n_classes,)
    The classes labels.

Notes
-----
The features are always randomly permuted at each split. Therefore,
the best found split may vary, even with the same training data and
``max_features=n_features``, if the improvement of the criterion is
identical for several splits enumerated during the search of the best
split. To obtain a deterministic behaviour during fitting,
``random_state`` has to be fixed.

See also
--------
sklearn.ensemble.HistGradientBoostingClassifier,
sklearn.tree.DecisionTreeClassifier, RandomForestClassifier
AdaBoostClassifier

References
----------
J. Friedman, Greedy Function Approximation: A Gradient Boosting
Machine, The Annals of Statistics, Vol. 29, No. 5, 2001.

J. Friedman, Stochastic Gradient Boosting, 1999

T. Hastie, R. Tibshirani and J. Friedman.
Elements of Statistical Learning Ed. 2, Springer, 2009.
*)

val get_item : index:Py.Object.t -> t -> Py.Object.t
(**
Return the index'th estimator in the ensemble.
*)

val apply : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Apply trees in the ensemble to X, return leaf indices.

.. versionadded:: 0.17

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will
    be converted to a sparse ``csr_matrix``.

Returns
-------
X_leaves : array-like, shape (n_samples, n_estimators, n_classes)
    For each datapoint x in X and for each tree in the ensemble,
    return the index of the leaf x ends up in each estimator.
    In the case of binary classification n_classes is 1.
*)

val decision_function : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Compute the decision function of ``X``.

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    The input samples. Internally, it will be converted to
    ``dtype=np.float32`` and if a sparse matrix is provided
    to a sparse ``csr_matrix``.

Returns
-------
score : array, shape (n_samples, n_classes) or (n_samples,)
    The decision function of the input samples, which corresponds to
    the raw values predicted from the trees of the ensemble . The
    order of the classes corresponds to that in the attribute
    :term:`classes_`. Regression and binary classification produce an
    array of shape [n_samples].
*)

val fit : ?sample_weight:[`Ndarray of Ndarray.t | `None] -> ?monitor:Py.Object.t -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> y:Ndarray.t -> t -> t
(**
Fit the gradient boosting model.

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    The input samples. Internally, it will be converted to
    ``dtype=np.float32`` and if a sparse matrix is provided
    to a sparse ``csr_matrix``.

y : array-like, shape (n_samples,)
    Target values (strings or integers in classification, real numbers
    in regression)
    For classification, labels must correspond to classes.

sample_weight : array-like, shape (n_samples,) or None
    Sample weights. If None, then samples are equally weighted. Splits
    that would create child nodes with net zero or negative weight are
    ignored while searching for a split in each node. In the case of
    classification, splits are also ignored if they would result in any
    single class carrying a negative weight in either child node.

monitor : callable, optional
    The monitor is called after each iteration with the current
    iteration, a reference to the estimator and the local variables of
    ``_fit_stages`` as keyword arguments ``callable(i, self,
    locals())``. If the callable returns ``True`` the fitting procedure
    is stopped. The monitor can be used for various things such as
    computing held-out estimates, early stopping, model introspect, and
    snapshoting.

Returns
-------
self : object
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get parameters for this estimator.

Parameters
----------
deep : bool, default=True
    If True, will return the parameters for this estimator and
    contained subobjects that are estimators.

Returns
-------
params : mapping of string to any
    Parameter names mapped to their values.
*)

val predict : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict class for X.

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    The input samples. Internally, it will be converted to
    ``dtype=np.float32`` and if a sparse matrix is provided
    to a sparse ``csr_matrix``.

Returns
-------
y : array, shape (n_samples,)
    The predicted values.
*)

val predict_log_proba : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict class log-probabilities for X.

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    The input samples. Internally, it will be converted to
    ``dtype=np.float32`` and if a sparse matrix is provided
    to a sparse ``csr_matrix``.

Raises
------
AttributeError
    If the ``loss`` does not support probabilities.

Returns
-------
p : array, shape (n_samples, n_classes)
    The class log-probabilities of the input samples. The order of the
    classes corresponds to that in the attribute :term:`classes_`.
*)

val predict_proba : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict class probabilities for X.

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    The input samples. Internally, it will be converted to
    ``dtype=np.float32`` and if a sparse matrix is provided
    to a sparse ``csr_matrix``.

Raises
------
AttributeError
    If the ``loss`` does not support probabilities.

Returns
-------
p : array, shape (n_samples, n_classes)
    The class probabilities of the input samples. The order of the
    classes corresponds to that in the attribute :term:`classes_`.
*)

val score : ?sample_weight:Ndarray.t -> x:Ndarray.t -> y:Ndarray.t -> t -> float
(**
Return the mean accuracy on the given test data and labels.

In multi-label classification, this is the subset accuracy
which is a harsh metric since you require for each sample that
each label set be correctly predicted.

Parameters
----------
X : array-like of shape (n_samples, n_features)
    Test samples.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    True labels for X.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights.

Returns
-------
score : float
    Mean accuracy of self.predict(X) wrt. y.
*)

val set_params : ?params:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of this estimator.

The method works on simple estimators as well as on nested objects
(such as pipelines). The latter have parameters of the form
``<component>__<parameter>`` so that it's possible to update each
component of a nested object.

Parameters
----------
**params : dict
    Estimator parameters.

Returns
-------
self : object
    Estimator instance.
*)

val staged_decision_function : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Py.Object.t
(**
Compute decision function of ``X`` for each iteration.

This method allows monitoring (i.e. determine error on testing set)
after each stage.

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    The input samples. Internally, it will be converted to
    ``dtype=np.float32`` and if a sparse matrix is provided
    to a sparse ``csr_matrix``.

Returns
-------
score : generator of array, shape (n_samples, k)
    The decision function of the input samples, which corresponds to
    the raw values predicted from the trees of the ensemble . The
    classes corresponds to that in the attribute :term:`classes_`.
    Regression and binary classification are special cases with
    ``k == 1``, otherwise ``k==n_classes``.
*)

val staged_predict : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Py.Object.t
(**
Predict class at each stage for X.

This method allows monitoring (i.e. determine error on testing set)
after each stage.

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    The input samples. Internally, it will be converted to
    ``dtype=np.float32`` and if a sparse matrix is provided
    to a sparse ``csr_matrix``.

Returns
-------
y : generator of array of shape (n_samples,)
    The predicted value of the input samples.
*)

val staged_predict_proba : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Py.Object.t
(**
Predict class probabilities at each stage for X.

This method allows monitoring (i.e. determine error on testing set)
after each stage.

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    The input samples. Internally, it will be converted to
    ``dtype=np.float32`` and if a sparse matrix is provided
    to a sparse ``csr_matrix``.

Returns
-------
y : generator of array of shape (n_samples,)
    The predicted value of the input samples.
*)


(** Attribute n_estimators_: see constructor for documentation *)
val n_estimators_ : t -> int

(** Attribute feature_importances_: see constructor for documentation *)
val feature_importances_ : t -> Ndarray.t

(** Attribute oob_improvement_: see constructor for documentation *)
val oob_improvement_ : t -> Ndarray.t

(** Attribute train_score_: see constructor for documentation *)
val train_score_ : t -> Ndarray.t

(** Attribute loss_: see constructor for documentation *)
val loss_ : t -> Py.Object.t

(** Attribute init_: see constructor for documentation *)
val init_ : t -> Py.Object.t

(** Attribute estimators_: see constructor for documentation *)
val estimators_ : t -> Py.Object.t

(** Attribute classes_: see constructor for documentation *)
val classes_ : t -> Ndarray.t

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module GradientBoostingRegressor : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?loss:[`Ls | `Lad | `Huber | `Quantile] -> ?learning_rate:float -> ?n_estimators:int -> ?subsample:float -> ?criterion:string -> ?min_samples_split:[`Int of int | `Float of float] -> ?min_samples_leaf:[`Int of int | `Float of float] -> ?min_weight_fraction_leaf:float -> ?max_depth:int -> ?min_impurity_decrease:float -> ?min_impurity_split:float -> ?init:[`Estimator of Py.Object.t | `Zero] -> ?random_state:[`Int of int | `RandomState of Py.Object.t | `None] -> ?max_features:[`Int of int | `Float of float | `String of string | `None] -> ?alpha:float -> ?verbose:int -> ?max_leaf_nodes:[`Int of int | `None] -> ?warm_start:bool -> ?presort:Py.Object.t -> ?validation_fraction:float -> ?n_iter_no_change:int -> ?tol:float -> ?ccp_alpha:float -> unit -> t
(**
Gradient Boosting for regression.

GB builds an additive model in a forward stage-wise fashion;
it allows for the optimization of arbitrary differentiable loss functions.
In each stage a regression tree is fit on the negative gradient of the
given loss function.

Read more in the :ref:`User Guide <gradient_boosting>`.

Parameters
----------
loss : {'ls', 'lad', 'huber', 'quantile'}, optional (default='ls')
    loss function to be optimized. 'ls' refers to least squares
    regression. 'lad' (least absolute deviation) is a highly robust
    loss function solely based on order information of the input
    variables. 'huber' is a combination of the two. 'quantile'
    allows quantile regression (use `alpha` to specify the quantile).

learning_rate : float, optional (default=0.1)
    learning rate shrinks the contribution of each tree by `learning_rate`.
    There is a trade-off between learning_rate and n_estimators.

n_estimators : int (default=100)
    The number of boosting stages to perform. Gradient boosting
    is fairly robust to over-fitting so a large number usually
    results in better performance.

subsample : float, optional (default=1.0)
    The fraction of samples to be used for fitting the individual base
    learners. If smaller than 1.0 this results in Stochastic Gradient
    Boosting. `subsample` interacts with the parameter `n_estimators`.
    Choosing `subsample < 1.0` leads to a reduction of variance
    and an increase in bias.

criterion : string, optional (default="friedman_mse")
    The function to measure the quality of a split. Supported criteria
    are "friedman_mse" for the mean squared error with improvement
    score by Friedman, "mse" for mean squared error, and "mae" for
    the mean absolute error. The default value of "friedman_mse" is
    generally the best as it can provide a better approximation in
    some cases.

    .. versionadded:: 0.18

min_samples_split : int, float, optional (default=2)
    The minimum number of samples required to split an internal node:

    - If int, then consider `min_samples_split` as the minimum number.
    - If float, then `min_samples_split` is a fraction and
      `ceil(min_samples_split * n_samples)` are the minimum
      number of samples for each split.

    .. versionchanged:: 0.18
       Added float values for fractions.

min_samples_leaf : int, float, optional (default=1)
    The minimum number of samples required to be at a leaf node.
    A split point at any depth will only be considered if it leaves at
    least ``min_samples_leaf`` training samples in each of the left and
    right branches.  This may have the effect of smoothing the model,
    especially in regression.

    - If int, then consider `min_samples_leaf` as the minimum number.
    - If float, then `min_samples_leaf` is a fraction and
      `ceil(min_samples_leaf * n_samples)` are the minimum
      number of samples for each node.

    .. versionchanged:: 0.18
       Added float values for fractions.

min_weight_fraction_leaf : float, optional (default=0.)
    The minimum weighted fraction of the sum total of weights (of all
    the input samples) required to be at a leaf node. Samples have
    equal weight when sample_weight is not provided.

max_depth : integer, optional (default=3)
    maximum depth of the individual regression estimators. The maximum
    depth limits the number of nodes in the tree. Tune this parameter
    for best performance; the best value depends on the interaction
    of the input variables.

min_impurity_decrease : float, optional (default=0.)
    A node will be split if this split induces a decrease of the impurity
    greater than or equal to this value.

    The weighted impurity decrease equation is the following::

        N_t / N * (impurity - N_t_R / N_t * right_impurity
                            - N_t_L / N_t * left_impurity)

    where ``N`` is the total number of samples, ``N_t`` is the number of
    samples at the current node, ``N_t_L`` is the number of samples in the
    left child, and ``N_t_R`` is the number of samples in the right child.

    ``N``, ``N_t``, ``N_t_R`` and ``N_t_L`` all refer to the weighted sum,
    if ``sample_weight`` is passed.

    .. versionadded:: 0.19

min_impurity_split : float, (default=1e-7)
    Threshold for early stopping in tree growth. A node will split
    if its impurity is above the threshold, otherwise it is a leaf.

    .. deprecated:: 0.19
       ``min_impurity_split`` has been deprecated in favor of
       ``min_impurity_decrease`` in 0.19. The default value of
       ``min_impurity_split`` will change from 1e-7 to 0 in 0.23 and it
       will be removed in 0.25. Use ``min_impurity_decrease`` instead.

init : estimator or 'zero', optional (default=None)
    An estimator object that is used to compute the initial predictions.
    ``init`` has to provide :term:`fit` and :term:`predict`. If 'zero', the
    initial raw predictions are set to zero. By default a
    ``DummyEstimator`` is used, predicting either the average target value
    (for loss='ls'), or a quantile for the other losses.

random_state : int, RandomState instance or None, optional (default=None)
    If int, random_state is the seed used by the random number generator;
    If RandomState instance, random_state is the random number generator;
    If None, the random number generator is the RandomState instance used
    by `np.random`.

max_features : int, float, string or None, optional (default=None)
    The number of features to consider when looking for the best split:

    - If int, then consider `max_features` features at each split.
    - If float, then `max_features` is a fraction and
      `int(max_features * n_features)` features are considered at each
      split.
    - If "auto", then `max_features=n_features`.
    - If "sqrt", then `max_features=sqrt(n_features)`.
    - If "log2", then `max_features=log2(n_features)`.
    - If None, then `max_features=n_features`.

    Choosing `max_features < n_features` leads to a reduction of variance
    and an increase in bias.

    Note: the search for a split does not stop until at least one
    valid partition of the node samples is found, even if it requires to
    effectively inspect more than ``max_features`` features.

alpha : float (default=0.9)
    The alpha-quantile of the huber loss function and the quantile
    loss function. Only if ``loss='huber'`` or ``loss='quantile'``.

verbose : int, default: 0
    Enable verbose output. If 1 then it prints progress and performance
    once in a while (the more trees the lower the frequency). If greater
    than 1 then it prints progress and performance for every tree.

max_leaf_nodes : int or None, optional (default=None)
    Grow trees with ``max_leaf_nodes`` in best-first fashion.
    Best nodes are defined as relative reduction in impurity.
    If None then unlimited number of leaf nodes.

warm_start : bool, default: False
    When set to ``True``, reuse the solution of the previous call to fit
    and add more estimators to the ensemble, otherwise, just erase the
    previous solution. See :term:`the Glossary <warm_start>`.

presort : deprecated, default='deprecated'
    This parameter is deprecated and will be removed in v0.24.

    .. deprecated :: 0.22

validation_fraction : float, optional, default 0.1
    The proportion of training data to set aside as validation set for
    early stopping. Must be between 0 and 1.
    Only used if ``n_iter_no_change`` is set to an integer.

    .. versionadded:: 0.20

n_iter_no_change : int, default None
    ``n_iter_no_change`` is used to decide if early stopping will be used
    to terminate training when validation score is not improving. By
    default it is set to None to disable early stopping. If set to a
    number, it will set aside ``validation_fraction`` size of the training
    data as validation and terminate training when validation score is not
    improving in all of the previous ``n_iter_no_change`` numbers of
    iterations.

    .. versionadded:: 0.20

tol : float, optional, default 1e-4
    Tolerance for the early stopping. When the loss is not improving
    by at least tol for ``n_iter_no_change`` iterations (if set to a
    number), the training stops.

    .. versionadded:: 0.20

ccp_alpha : non-negative float, optional (default=0.0)
    Complexity parameter used for Minimal Cost-Complexity Pruning. The
    subtree with the largest cost complexity that is smaller than
    ``ccp_alpha`` will be chosen. By default, no pruning is performed. See
    :ref:`minimal_cost_complexity_pruning` for details.

    .. versionadded:: 0.22

Attributes
----------
feature_importances_ : array, shape (n_features,)
    The feature importances (the higher, the more important the feature).

oob_improvement_ : array, shape (n_estimators,)
    The improvement in loss (= deviance) on the out-of-bag samples
    relative to the previous iteration.
    ``oob_improvement_[0]`` is the improvement in
    loss of the first stage over the ``init`` estimator.
    Only available if ``subsample < 1.0``

train_score_ : array, shape (n_estimators,)
    The i-th score ``train_score_[i]`` is the deviance (= loss) of the
    model at iteration ``i`` on the in-bag sample.
    If ``subsample == 1`` this is the deviance on the training data.

loss_ : LossFunction
    The concrete ``LossFunction`` object.

init_ : estimator
    The estimator that provides the initial predictions.
    Set via the ``init`` argument or ``loss.init_estimator``.

estimators_ : array of DecisionTreeRegressor, shape (n_estimators, 1)
    The collection of fitted sub-estimators.

Notes
-----
The features are always randomly permuted at each split. Therefore,
the best found split may vary, even with the same training data and
``max_features=n_features``, if the improvement of the criterion is
identical for several splits enumerated during the search of the best
split. To obtain a deterministic behaviour during fitting,
``random_state`` has to be fixed.

See also
--------
sklearn.ensemble.HistGradientBoostingRegressor,
sklearn.tree.DecisionTreeRegressor, RandomForestRegressor

References
----------
J. Friedman, Greedy Function Approximation: A Gradient Boosting
Machine, The Annals of Statistics, Vol. 29, No. 5, 2001.

J. Friedman, Stochastic Gradient Boosting, 1999

T. Hastie, R. Tibshirani and J. Friedman.
Elements of Statistical Learning Ed. 2, Springer, 2009.
*)

val get_item : index:Py.Object.t -> t -> Py.Object.t
(**
Return the index'th estimator in the ensemble.
*)

val apply : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Apply trees in the ensemble to X, return leaf indices.

.. versionadded:: 0.17

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will
    be converted to a sparse ``csr_matrix``.

Returns
-------
X_leaves : array-like, shape (n_samples, n_estimators)
    For each datapoint x in X and for each tree in the ensemble,
    return the index of the leaf x ends up in each estimator.
*)

val fit : ?sample_weight:[`Ndarray of Ndarray.t | `None] -> ?monitor:Py.Object.t -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> y:Ndarray.t -> t -> t
(**
Fit the gradient boosting model.

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    The input samples. Internally, it will be converted to
    ``dtype=np.float32`` and if a sparse matrix is provided
    to a sparse ``csr_matrix``.

y : array-like, shape (n_samples,)
    Target values (strings or integers in classification, real numbers
    in regression)
    For classification, labels must correspond to classes.

sample_weight : array-like, shape (n_samples,) or None
    Sample weights. If None, then samples are equally weighted. Splits
    that would create child nodes with net zero or negative weight are
    ignored while searching for a split in each node. In the case of
    classification, splits are also ignored if they would result in any
    single class carrying a negative weight in either child node.

monitor : callable, optional
    The monitor is called after each iteration with the current
    iteration, a reference to the estimator and the local variables of
    ``_fit_stages`` as keyword arguments ``callable(i, self,
    locals())``. If the callable returns ``True`` the fitting procedure
    is stopped. The monitor can be used for various things such as
    computing held-out estimates, early stopping, model introspect, and
    snapshoting.

Returns
-------
self : object
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get parameters for this estimator.

Parameters
----------
deep : bool, default=True
    If True, will return the parameters for this estimator and
    contained subobjects that are estimators.

Returns
-------
params : mapping of string to any
    Parameter names mapped to their values.
*)

val predict : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict regression target for X.

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    The input samples. Internally, it will be converted to
    ``dtype=np.float32`` and if a sparse matrix is provided
    to a sparse ``csr_matrix``.

Returns
-------
y : array, shape (n_samples,)
    The predicted values.
*)

val score : ?sample_weight:Ndarray.t -> x:Ndarray.t -> y:Ndarray.t -> t -> float
(**
Return the coefficient of determination R^2 of the prediction.

The coefficient R^2 is defined as (1 - u/v), where u is the residual
sum of squares ((y_true - y_pred) ** 2).sum() and v is the total
sum of squares ((y_true - y_true.mean()) ** 2).sum().
The best possible score is 1.0 and it can be negative (because the
model can be arbitrarily worse). A constant model that always
predicts the expected value of y, disregarding the input features,
would get a R^2 score of 0.0.

Parameters
----------
X : array-like of shape (n_samples, n_features)
    Test samples. For some estimators this may be a
    precomputed kernel matrix or a list of generic objects instead,
    shape = (n_samples, n_samples_fitted),
    where n_samples_fitted is the number of
    samples used in the fitting for the estimator.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    True values for X.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights.

Returns
-------
score : float
    R^2 of self.predict(X) wrt. y.

Notes
-----
The R2 score used when calling ``score`` on a regressor will use
``multioutput='uniform_average'`` from version 0.23 to keep consistent
with :func:`~sklearn.metrics.r2_score`. This will influence the
``score`` method of all the multioutput regressors (except for
:class:`~sklearn.multioutput.MultiOutputRegressor`). To specify the
default value manually and avoid the warning, please either call
:func:`~sklearn.metrics.r2_score` directly or make a custom scorer with
:func:`~sklearn.metrics.make_scorer` (the built-in scorer ``'r2'`` uses
``multioutput='uniform_average'``).
*)

val set_params : ?params:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of this estimator.

The method works on simple estimators as well as on nested objects
(such as pipelines). The latter have parameters of the form
``<component>__<parameter>`` so that it's possible to update each
component of a nested object.

Parameters
----------
**params : dict
    Estimator parameters.

Returns
-------
self : object
    Estimator instance.
*)

val staged_predict : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Py.Object.t
(**
Predict regression target at each stage for X.

This method allows monitoring (i.e. determine error on testing set)
after each stage.

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    The input samples. Internally, it will be converted to
    ``dtype=np.float32`` and if a sparse matrix is provided
    to a sparse ``csr_matrix``.

Returns
-------
y : generator of array of shape (n_samples,)
    The predicted value of the input samples.
*)


(** Attribute feature_importances_: see constructor for documentation *)
val feature_importances_ : t -> Ndarray.t

(** Attribute oob_improvement_: see constructor for documentation *)
val oob_improvement_ : t -> Ndarray.t

(** Attribute train_score_: see constructor for documentation *)
val train_score_ : t -> Ndarray.t

(** Attribute loss_: see constructor for documentation *)
val loss_ : t -> Py.Object.t

(** Attribute init_: see constructor for documentation *)
val init_ : t -> Py.Object.t

(** Attribute estimators_: see constructor for documentation *)
val estimators_ : t -> Py.Object.t

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module IsolationForest : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?n_estimators:int -> ?max_samples:[`Int of int | `Float of float] -> ?contamination:[`Auto | `Float of float] -> ?max_features:[`Int of int | `Float of float] -> ?bootstrap:bool -> ?n_jobs:[`Int of int | `None] -> ?behaviour:string -> ?random_state:[`Int of int | `RandomState of Py.Object.t | `None] -> ?verbose:int -> ?warm_start:bool -> unit -> t
(**
Isolation Forest Algorithm.

Return the anomaly score of each sample using the IsolationForest algorithm

The IsolationForest 'isolates' observations by randomly selecting a feature
and then randomly selecting a split value between the maximum and minimum
values of the selected feature.

Since recursive partitioning can be represented by a tree structure, the
number of splittings required to isolate a sample is equivalent to the path
length from the root node to the terminating node.

This path length, averaged over a forest of such random trees, is a
measure of normality and our decision function.

Random partitioning produces noticeably shorter paths for anomalies.
Hence, when a forest of random trees collectively produce shorter path
lengths for particular samples, they are highly likely to be anomalies.

Read more in the :ref:`User Guide <isolation_forest>`.

.. versionadded:: 0.18

Parameters
----------
n_estimators : int, optional (default=100)
    The number of base estimators in the ensemble.

max_samples : int or float, optional (default="auto")
    The number of samples to draw from X to train each base estimator.
        - If int, then draw `max_samples` samples.
        - If float, then draw `max_samples * X.shape[0]` samples.
        - If "auto", then `max_samples=min(256, n_samples)`.

    If max_samples is larger than the number of samples provided,
    all samples will be used for all trees (no sampling).

contamination : 'auto' or float, optional (default='auto')
    The amount of contamination of the data set, i.e. the proportion
    of outliers in the data set. Used when fitting to define the threshold
    on the scores of the samples.

        - If 'auto', the threshold is determined as in the
          original paper.
        - If float, the contamination should be in the range [0, 0.5].

    .. versionchanged:: 0.22
       The default value of ``contamination`` changed from 0.1
       to ``'auto'``.

max_features : int or float, optional (default=1.0)
    The number of features to draw from X to train each base estimator.

        - If int, then draw `max_features` features.
        - If float, then draw `max_features * X.shape[1]` features.

bootstrap : bool, optional (default=False)
    If True, individual trees are fit on random subsets of the training
    data sampled with replacement. If False, sampling without replacement
    is performed.

n_jobs : int or None, optional (default=None)
    The number of jobs to run in parallel for both :meth:`fit` and
    :meth:`predict`. ``None`` means 1 unless in a
    :obj:`joblib.parallel_backend` context. ``-1`` means using all
    processors. See :term:`Glossary <n_jobs>` for more details.

behaviour : str, default='deprecated'
    This parameter has not effect, is deprecated, and will be removed.

    .. versionadded:: 0.20
       ``behaviour`` is added in 0.20 for back-compatibility purpose.

    .. deprecated:: 0.20
       ``behaviour='old'`` is deprecated in 0.20 and will not be possible
       in 0.22.

    .. deprecated:: 0.22
       ``behaviour`` parameter is deprecated in 0.22 and removed in
       0.24.

random_state : int, RandomState instance or None, optional (default=None)
    If int, random_state is the seed used by the random number generator;
    If RandomState instance, random_state is the random number generator;
    If None, the random number generator is the RandomState instance used
    by `np.random`.

verbose : int, optional (default=0)
    Controls the verbosity of the tree building process.

warm_start : bool, optional (default=False)
    When set to ``True``, reuse the solution of the previous call to fit
    and add more estimators to the ensemble, otherwise, just fit a whole
    new forest. See :term:`the Glossary <warm_start>`.

    .. versionadded:: 0.21

Attributes
----------
estimators_ : list of DecisionTreeClassifier
    The collection of fitted sub-estimators.

estimators_samples_ : list of arrays
    The subset of drawn samples (i.e., the in-bag samples) for each base
    estimator.

max_samples_ : integer
    The actual number of samples

offset_ : float
    Offset used to define the decision function from the raw scores. We
    have the relation: ``decision_function = score_samples - offset_``.
    ``offset_`` is defined as follows. When the contamination parameter is
    set to "auto", the offset is equal to -0.5 as the scores of inliers are
    close to 0 and the scores of outliers are close to -1. When a
    contamination parameter different than "auto" is provided, the offset
    is defined in such a way we obtain the expected number of outliers
    (samples with decision function < 0) in training.

Notes
-----
The implementation is based on an ensemble of ExtraTreeRegressor. The
maximum depth of each tree is set to ``ceil(log_2(n))`` where
:math:`n` is the number of samples used to build the tree
(see (Liu et al., 2008) for more details).

References
----------
.. [1] Liu, Fei Tony, Ting, Kai Ming and Zhou, Zhi-Hua. "Isolation forest."
       Data Mining, 2008. ICDM'08. Eighth IEEE International Conference on.
.. [2] Liu, Fei Tony, Ting, Kai Ming and Zhou, Zhi-Hua. "Isolation-based
       anomaly detection." ACM Transactions on Knowledge Discovery from
       Data (TKDD) 6.1 (2012): 3.

See Also
----------
sklearn.covariance.EllipticEnvelope : An object for detecting outliers in a
    Gaussian distributed dataset.
sklearn.svm.OneClassSVM : Unsupervised Outlier Detection.
    Estimate the support of a high-dimensional distribution.
    The implementation is based on libsvm.
sklearn.neighbors.LocalOutlierFactor : Unsupervised Outlier Detection
    using Local Outlier Factor (LOF).

Examples
--------
>>> from sklearn.ensemble import IsolationForest
>>> X = [[-1.1], [0.3], [0.5], [100]]
>>> clf = IsolationForest(random_state=0).fit(X)
>>> clf.predict([[0.1], [0], [90]])
array([ 1,  1, -1])
*)

val get_item : index:Py.Object.t -> t -> Py.Object.t
(**
Return the index'th estimator in the ensemble.
*)

val decision_function : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Average anomaly score of X of the base classifiers.

The anomaly score of an input sample is computed as
the mean anomaly score of the trees in the forest.

The measure of normality of an observation given a tree is the depth
of the leaf containing this observation, which is equivalent to
the number of splittings required to isolate this point. In case of
several observations n_left in the leaf, the average path length of
a n_left samples isolation tree is added.

Parameters
----------
X : array-like or sparse matrix, shape (n_samples, n_features)
    The input samples. Internally, it will be converted to
    ``dtype=np.float32`` and if a sparse matrix is provided
    to a sparse ``csr_matrix``.

Returns
-------
scores : array, shape (n_samples,)
    The anomaly score of the input samples.
    The lower, the more abnormal. Negative scores represent outliers,
    positive scores represent inliers.
*)

val fit : ?y:Py.Object.t -> ?sample_weight:Ndarray.t -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> t
(**
Fit estimator.

Parameters
----------
X : array-like or sparse matrix, shape (n_samples, n_features)
    The input samples. Use ``dtype=np.float32`` for maximum
    efficiency. Sparse matrices are also supported, use sparse
    ``csc_matrix`` for maximum efficiency.

y : Ignored
    Not used, present for API consistency by convention.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights. If None, then samples are equally weighted.

Returns
-------
self : object
    Fitted estimator.
*)

val fit_predict : ?y:Py.Object.t -> x:Ndarray.t -> t -> Ndarray.t
(**
Perform fit on X and returns labels for X.

Returns -1 for outliers and 1 for inliers.

Parameters
----------
X : ndarray, shape (n_samples, n_features)
    Input data.

y : Ignored
    Not used, present for API consistency by convention.

Returns
-------
y : ndarray, shape (n_samples,)
    1 for inliers, -1 for outliers.
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get parameters for this estimator.

Parameters
----------
deep : bool, default=True
    If True, will return the parameters for this estimator and
    contained subobjects that are estimators.

Returns
-------
params : mapping of string to any
    Parameter names mapped to their values.
*)

val predict : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict if a particular sample is an outlier or not.

Parameters
----------
X : array-like or sparse matrix, shape (n_samples, n_features)
    The input samples. Internally, it will be converted to
    ``dtype=np.float32`` and if a sparse matrix is provided
    to a sparse ``csr_matrix``.

Returns
-------
is_inlier : array, shape (n_samples,)
    For each observation, tells whether or not (+1 or -1) it should
    be considered as an inlier according to the fitted model.
*)

val score_samples : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Opposite of the anomaly score defined in the original paper.

The anomaly score of an input sample is computed as
the mean anomaly score of the trees in the forest.

The measure of normality of an observation given a tree is the depth
of the leaf containing this observation, which is equivalent to
the number of splittings required to isolate this point. In case of
several observations n_left in the leaf, the average path length of
a n_left samples isolation tree is added.

Parameters
----------
X : array-like or sparse matrix, shape (n_samples, n_features)
    The input samples.

Returns
-------
scores : array, shape (n_samples,)
    The anomaly score of the input samples.
    The lower, the more abnormal.
*)

val set_params : ?params:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of this estimator.

The method works on simple estimators as well as on nested objects
(such as pipelines). The latter have parameters of the form
``<component>__<parameter>`` so that it's possible to update each
component of a nested object.

Parameters
----------
**params : dict
    Estimator parameters.

Returns
-------
self : object
    Estimator instance.
*)


(** Attribute estimators_: see constructor for documentation *)
val estimators_ : t -> Py.Object.t

(** Attribute estimators_samples_: see constructor for documentation *)
val estimators_samples_ : t -> Py.Object.t

(** Attribute max_samples_: see constructor for documentation *)
val max_samples_ : t -> int

(** Attribute offset_: see constructor for documentation *)
val offset_ : t -> float

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module RandomForestClassifier : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?n_estimators:int -> ?criterion:string -> ?max_depth:[`Int of int | `None] -> ?min_samples_split:[`Int of int | `Float of float] -> ?min_samples_leaf:[`Int of int | `Float of float] -> ?min_weight_fraction_leaf:float -> ?max_features:[`Int of int | `Float of float | `String of string | `None] -> ?max_leaf_nodes:[`Int of int | `None] -> ?min_impurity_decrease:float -> ?min_impurity_split:float -> ?bootstrap:bool -> ?oob_score:bool -> ?n_jobs:[`Int of int | `None] -> ?random_state:[`Int of int | `RandomState of Py.Object.t | `None] -> ?verbose:int -> ?warm_start:bool -> ?class_weight:[`DictIntToFloat of (int * float) list | `Balanced | `Balanced_subsample | `None | `PyObject of Py.Object.t] -> ?ccp_alpha:float -> ?max_samples:[`Int of int | `Float of float] -> unit -> t
(**
A random forest classifier.

A random forest is a meta estimator that fits a number of decision tree
classifiers on various sub-samples of the dataset and uses averaging to
improve the predictive accuracy and control over-fitting.
The sub-sample size is always the same as the original
input sample size but the samples are drawn with replacement if
`bootstrap=True` (default).

Read more in the :ref:`User Guide <forest>`.

Parameters
----------
n_estimators : integer, optional (default=100)
    The number of trees in the forest.

    .. versionchanged:: 0.22
       The default value of ``n_estimators`` changed from 10 to 100
       in 0.22.

criterion : string, optional (default="gini")
    The function to measure the quality of a split. Supported criteria are
    "gini" for the Gini impurity and "entropy" for the information gain.
    Note: this parameter is tree-specific.

max_depth : integer or None, optional (default=None)
    The maximum depth of the tree. If None, then nodes are expanded until
    all leaves are pure or until all leaves contain less than
    min_samples_split samples.

min_samples_split : int, float, optional (default=2)
    The minimum number of samples required to split an internal node:

    - If int, then consider `min_samples_split` as the minimum number.
    - If float, then `min_samples_split` is a fraction and
      `ceil(min_samples_split * n_samples)` are the minimum
      number of samples for each split.

    .. versionchanged:: 0.18
       Added float values for fractions.

min_samples_leaf : int, float, optional (default=1)
    The minimum number of samples required to be at a leaf node.
    A split point at any depth will only be considered if it leaves at
    least ``min_samples_leaf`` training samples in each of the left and
    right branches.  This may have the effect of smoothing the model,
    especially in regression.

    - If int, then consider `min_samples_leaf` as the minimum number.
    - If float, then `min_samples_leaf` is a fraction and
      `ceil(min_samples_leaf * n_samples)` are the minimum
      number of samples for each node.

    .. versionchanged:: 0.18
       Added float values for fractions.

min_weight_fraction_leaf : float, optional (default=0.)
    The minimum weighted fraction of the sum total of weights (of all
    the input samples) required to be at a leaf node. Samples have
    equal weight when sample_weight is not provided.

max_features : int, float, string or None, optional (default="auto")
    The number of features to consider when looking for the best split:

    - If int, then consider `max_features` features at each split.
    - If float, then `max_features` is a fraction and
      `int(max_features * n_features)` features are considered at each
      split.
    - If "auto", then `max_features=sqrt(n_features)`.
    - If "sqrt", then `max_features=sqrt(n_features)` (same as "auto").
    - If "log2", then `max_features=log2(n_features)`.
    - If None, then `max_features=n_features`.

    Note: the search for a split does not stop until at least one
    valid partition of the node samples is found, even if it requires to
    effectively inspect more than ``max_features`` features.

max_leaf_nodes : int or None, optional (default=None)
    Grow trees with ``max_leaf_nodes`` in best-first fashion.
    Best nodes are defined as relative reduction in impurity.
    If None then unlimited number of leaf nodes.

min_impurity_decrease : float, optional (default=0.)
    A node will be split if this split induces a decrease of the impurity
    greater than or equal to this value.

    The weighted impurity decrease equation is the following::

        N_t / N * (impurity - N_t_R / N_t * right_impurity
                            - N_t_L / N_t * left_impurity)

    where ``N`` is the total number of samples, ``N_t`` is the number of
    samples at the current node, ``N_t_L`` is the number of samples in the
    left child, and ``N_t_R`` is the number of samples in the right child.

    ``N``, ``N_t``, ``N_t_R`` and ``N_t_L`` all refer to the weighted sum,
    if ``sample_weight`` is passed.

    .. versionadded:: 0.19

min_impurity_split : float, (default=1e-7)
    Threshold for early stopping in tree growth. A node will split
    if its impurity is above the threshold, otherwise it is a leaf.

    .. deprecated:: 0.19
       ``min_impurity_split`` has been deprecated in favor of
       ``min_impurity_decrease`` in 0.19. The default value of
       ``min_impurity_split`` will change from 1e-7 to 0 in 0.23 and it
       will be removed in 0.25. Use ``min_impurity_decrease`` instead.


bootstrap : boolean, optional (default=True)
    Whether bootstrap samples are used when building trees. If False, the
    whole datset is used to build each tree.

oob_score : bool (default=False)
    Whether to use out-of-bag samples to estimate
    the generalization accuracy.

n_jobs : int or None, optional (default=None)
    The number of jobs to run in parallel. :meth:`fit`, :meth:`predict`,
    :meth:`decision_path` and :meth:`apply` are all parallelized over the
    trees. ``None`` means 1 unless in a :obj:`joblib.parallel_backend`
    context. ``-1`` means using all processors. See :term:`Glossary
    <n_jobs>` for more details.

random_state : int, RandomState instance or None, optional (default=None)
    Controls both the randomness of the bootstrapping of the samples used
    when building trees (if ``bootstrap=True``) and the sampling of the
    features to consider when looking for the best split at each node
    (if ``max_features < n_features``).
    See :term:`Glossary <random_state>` for details.

verbose : int, optional (default=0)
    Controls the verbosity when fitting and predicting.

warm_start : bool, optional (default=False)
    When set to ``True``, reuse the solution of the previous call to fit
    and add more estimators to the ensemble, otherwise, just fit a whole
    new forest. See :term:`the Glossary <warm_start>`.

class_weight : dict, list of dicts, "balanced", "balanced_subsample" or     None, optional (default=None)
    Weights associated with classes in the form ``{class_label: weight}``.
    If not given, all classes are supposed to have weight one. For
    multi-output problems, a list of dicts can be provided in the same
    order as the columns of y.

    Note that for multioutput (including multilabel) weights should be
    defined for each class of every column in its own dict. For example,
    for four-class multilabel classification weights should be
    [{0: 1, 1: 1}, {0: 1, 1: 5}, {0: 1, 1: 1}, {0: 1, 1: 1}] instead of
    [{1:1}, {2:5}, {3:1}, {4:1}].

    The "balanced" mode uses the values of y to automatically adjust
    weights inversely proportional to class frequencies in the input data
    as ``n_samples / (n_classes * np.bincount(y))``

    The "balanced_subsample" mode is the same as "balanced" except that
    weights are computed based on the bootstrap sample for every tree
    grown.

    For multi-output, the weights of each column of y will be multiplied.

    Note that these weights will be multiplied with sample_weight (passed
    through the fit method) if sample_weight is specified.

ccp_alpha : non-negative float, optional (default=0.0)
    Complexity parameter used for Minimal Cost-Complexity Pruning. The
    subtree with the largest cost complexity that is smaller than
    ``ccp_alpha`` will be chosen. By default, no pruning is performed. See
    :ref:`minimal_cost_complexity_pruning` for details.

    .. versionadded:: 0.22

max_samples : int or float, default=None
    If bootstrap is True, the number of samples to draw from X
    to train each base estimator.

    - If None (default), then draw `X.shape[0]` samples.
    - If int, then draw `max_samples` samples.
    - If float, then draw `max_samples * X.shape[0]` samples. Thus,
      `max_samples` should be in the interval `(0, 1)`.

    .. versionadded:: 0.22

Attributes
----------
base_estimator_ : DecisionTreeClassifier
    The child estimator template used to create the collection of fitted
    sub-estimators.

estimators_ : list of DecisionTreeClassifier
    The collection of fitted sub-estimators.

classes_ : array of shape (n_classes,) or a list of such arrays
    The classes labels (single output problem), or a list of arrays of
    class labels (multi-output problem).

n_classes_ : int or list
    The number of classes (single output problem), or a list containing the
    number of classes for each output (multi-output problem).

n_features_ : int
    The number of features when ``fit`` is performed.

n_outputs_ : int
    The number of outputs when ``fit`` is performed.

feature_importances_ : ndarray of shape (n_features,)
    The feature importances (the higher, the more important the feature).

oob_score_ : float
    Score of the training dataset obtained using an out-of-bag estimate.
    This attribute exists only when ``oob_score`` is True.

oob_decision_function_ : array of shape (n_samples, n_classes)
    Decision function computed with out-of-bag estimate on the training
    set. If n_estimators is small it might be possible that a data point
    was never left out during the bootstrap. In this case,
    `oob_decision_function_` might contain NaN. This attribute exists
    only when ``oob_score`` is True.

Examples
--------
>>> from sklearn.ensemble import RandomForestClassifier
>>> from sklearn.datasets import make_classification

>>> X, y = make_classification(n_samples=1000, n_features=4,
...                            n_informative=2, n_redundant=0,
...                            random_state=0, shuffle=False)
>>> clf = RandomForestClassifier(max_depth=2, random_state=0)
>>> clf.fit(X, y)
RandomForestClassifier(max_depth=2, random_state=0)
>>> print(clf.feature_importances_)
[0.14205973 0.76664038 0.0282433  0.06305659]
>>> print(clf.predict([[0, 0, 0, 0]]))
[1]

Notes
-----
The default values for the parameters controlling the size of the trees
(e.g. ``max_depth``, ``min_samples_leaf``, etc.) lead to fully grown and
unpruned trees which can potentially be very large on some data sets. To
reduce memory consumption, the complexity and size of the trees should be
controlled by setting those parameter values.

The features are always randomly permuted at each split. Therefore,
the best found split may vary, even with the same training data,
``max_features=n_features`` and ``bootstrap=False``, if the improvement
of the criterion is identical for several splits enumerated during the
search of the best split. To obtain a deterministic behaviour during
fitting, ``random_state`` has to be fixed.

References
----------

.. [1] L. Breiman, "Random Forests", Machine Learning, 45(1), 5-32, 2001.

See Also
--------
DecisionTreeClassifier, ExtraTreesClassifier
*)

val get_item : index:Py.Object.t -> t -> Py.Object.t
(**
Return the index'th estimator in the ensemble.
*)

val apply : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Apply trees in the forest to X, return leaf indices.

Parameters
----------
X : {array-like or sparse matrix} of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
X_leaves : array_like, shape = [n_samples, n_estimators]
    For each datapoint x in X and for each tree in the forest,
    return the index of the leaf x ends up in.
*)

val decision_path : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> (Py.Object.t * Py.Object.t)
(**
Return the decision path in the forest.

.. versionadded:: 0.18

Parameters
----------
X : {array-like or sparse matrix} of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
indicator : sparse csr array, shape = [n_samples, n_nodes]
    Return a node indicator matrix where non zero elements
    indicates that the samples goes through the nodes.

n_nodes_ptr : array of size (n_estimators + 1, )
    The columns from indicator[n_nodes_ptr[i]:n_nodes_ptr[i+1]]
    gives the indicator value for the i-th estimator.
*)

val fit : ?sample_weight:Ndarray.t -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> y:Ndarray.t -> t -> t
(**
Build a forest of trees from the training set (X, y).

Parameters
----------
X : array-like or sparse matrix of shape (n_samples, n_features)
    The training input samples. Internally, its dtype will be converted
    to ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csc_matrix``.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    The target values (class labels in classification, real numbers in
    regression).

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights. If None, then samples are equally weighted. Splits
    that would create child nodes with net zero or negative weight are
    ignored while searching for a split in each node. In the case of
    classification, splits are also ignored if they would result in any
    single class carrying a negative weight in either child node.

Returns
-------
self : object
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get parameters for this estimator.

Parameters
----------
deep : bool, default=True
    If True, will return the parameters for this estimator and
    contained subobjects that are estimators.

Returns
-------
params : mapping of string to any
    Parameter names mapped to their values.
*)

val predict : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict class for X.

The predicted class of an input sample is a vote by the trees in
the forest, weighted by their probability estimates. That is,
the predicted class is the one with highest mean probability
estimate across the trees.

Parameters
----------
X : array-like or sparse matrix of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    The predicted classes.
*)

val predict_log_proba : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Py.Object.t
(**
Predict class log-probabilities for X.

The predicted class log-probabilities of an input sample is computed as
the log of the mean predicted class probabilities of the trees in the
forest.

Parameters
----------
X : array-like or sparse matrix of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
p : array of shape (n_samples, n_classes), or a list of n_outputs
    such arrays if n_outputs > 1.
    The class probabilities of the input samples. The order of the
    classes corresponds to that in the attribute :term:`classes_`.
*)

val predict_proba : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict class probabilities for X.

The predicted class probabilities of an input sample are computed as
the mean predicted class probabilities of the trees in the forest.
The class probability of a single tree is the fraction of samples of
the same class in a leaf.

Parameters
----------
X : array-like or sparse matrix of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
p : array of shape (n_samples, n_classes), or a list of n_outputs
    such arrays if n_outputs > 1.
    The class probabilities of the input samples. The order of the
    classes corresponds to that in the attribute :term:`classes_`.
*)

val score : ?sample_weight:Ndarray.t -> x:Ndarray.t -> y:Ndarray.t -> t -> float
(**
Return the mean accuracy on the given test data and labels.

In multi-label classification, this is the subset accuracy
which is a harsh metric since you require for each sample that
each label set be correctly predicted.

Parameters
----------
X : array-like of shape (n_samples, n_features)
    Test samples.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    True labels for X.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights.

Returns
-------
score : float
    Mean accuracy of self.predict(X) wrt. y.
*)

val set_params : ?params:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of this estimator.

The method works on simple estimators as well as on nested objects
(such as pipelines). The latter have parameters of the form
``<component>__<parameter>`` so that it's possible to update each
component of a nested object.

Parameters
----------
**params : dict
    Estimator parameters.

Returns
-------
self : object
    Estimator instance.
*)


(** Attribute base_estimator_: see constructor for documentation *)
val base_estimator_ : t -> Py.Object.t

(** Attribute estimators_: see constructor for documentation *)
val estimators_ : t -> Py.Object.t

(** Attribute classes_: see constructor for documentation *)
val classes_ : t -> Ndarray.t

(** Attribute n_classes_: see constructor for documentation *)
val n_classes_ : t -> Py.Object.t

(** Attribute n_features_: see constructor for documentation *)
val n_features_ : t -> int

(** Attribute n_outputs_: see constructor for documentation *)
val n_outputs_ : t -> int

(** Attribute feature_importances_: see constructor for documentation *)
val feature_importances_ : t -> Ndarray.t

(** Attribute oob_score_: see constructor for documentation *)
val oob_score_ : t -> float

(** Attribute oob_decision_function_: see constructor for documentation *)
val oob_decision_function_ : t -> Ndarray.t

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module RandomForestRegressor : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?n_estimators:int -> ?criterion:string -> ?max_depth:[`Int of int | `None] -> ?min_samples_split:[`Int of int | `Float of float] -> ?min_samples_leaf:[`Int of int | `Float of float] -> ?min_weight_fraction_leaf:float -> ?max_features:[`Int of int | `Float of float | `String of string | `None] -> ?max_leaf_nodes:[`Int of int | `None] -> ?min_impurity_decrease:float -> ?min_impurity_split:float -> ?bootstrap:bool -> ?oob_score:bool -> ?n_jobs:[`Int of int | `None] -> ?random_state:[`Int of int | `RandomState of Py.Object.t | `None] -> ?verbose:int -> ?warm_start:bool -> ?ccp_alpha:float -> ?max_samples:[`Int of int | `Float of float] -> unit -> t
(**
A random forest regressor.

A random forest is a meta estimator that fits a number of classifying
decision trees on various sub-samples of the dataset and uses averaging
to improve the predictive accuracy and control over-fitting.
The sub-sample size is always the same as the original
input sample size but the samples are drawn with replacement if
`bootstrap=True` (default).

Read more in the :ref:`User Guide <forest>`.

Parameters
----------
n_estimators : integer, optional (default=10)
    The number of trees in the forest.

    .. versionchanged:: 0.22
       The default value of ``n_estimators`` changed from 10 to 100
       in 0.22.

criterion : string, optional (default="mse")
    The function to measure the quality of a split. Supported criteria
    are "mse" for the mean squared error, which is equal to variance
    reduction as feature selection criterion, and "mae" for the mean
    absolute error.

    .. versionadded:: 0.18
       Mean Absolute Error (MAE) criterion.

max_depth : integer or None, optional (default=None)
    The maximum depth of the tree. If None, then nodes are expanded until
    all leaves are pure or until all leaves contain less than
    min_samples_split samples.

min_samples_split : int, float, optional (default=2)
    The minimum number of samples required to split an internal node:

    - If int, then consider `min_samples_split` as the minimum number.
    - If float, then `min_samples_split` is a fraction and
      `ceil(min_samples_split * n_samples)` are the minimum
      number of samples for each split.

    .. versionchanged:: 0.18
       Added float values for fractions.

min_samples_leaf : int, float, optional (default=1)
    The minimum number of samples required to be at a leaf node.
    A split point at any depth will only be considered if it leaves at
    least ``min_samples_leaf`` training samples in each of the left and
    right branches.  This may have the effect of smoothing the model,
    especially in regression.

    - If int, then consider `min_samples_leaf` as the minimum number.
    - If float, then `min_samples_leaf` is a fraction and
      `ceil(min_samples_leaf * n_samples)` are the minimum
      number of samples for each node.

    .. versionchanged:: 0.18
       Added float values for fractions.

min_weight_fraction_leaf : float, optional (default=0.)
    The minimum weighted fraction of the sum total of weights (of all
    the input samples) required to be at a leaf node. Samples have
    equal weight when sample_weight is not provided.

max_features : int, float, string or None, optional (default="auto")
    The number of features to consider when looking for the best split:

    - If int, then consider `max_features` features at each split.
    - If float, then `max_features` is a fraction and
      `int(max_features * n_features)` features are considered at each
      split.
    - If "auto", then `max_features=n_features`.
    - If "sqrt", then `max_features=sqrt(n_features)`.
    - If "log2", then `max_features=log2(n_features)`.
    - If None, then `max_features=n_features`.

    Note: the search for a split does not stop until at least one
    valid partition of the node samples is found, even if it requires to
    effectively inspect more than ``max_features`` features.

max_leaf_nodes : int or None, optional (default=None)
    Grow trees with ``max_leaf_nodes`` in best-first fashion.
    Best nodes are defined as relative reduction in impurity.
    If None then unlimited number of leaf nodes.

min_impurity_decrease : float, optional (default=0.)
    A node will be split if this split induces a decrease of the impurity
    greater than or equal to this value.

    The weighted impurity decrease equation is the following::

        N_t / N * (impurity - N_t_R / N_t * right_impurity
                            - N_t_L / N_t * left_impurity)

    where ``N`` is the total number of samples, ``N_t`` is the number of
    samples at the current node, ``N_t_L`` is the number of samples in the
    left child, and ``N_t_R`` is the number of samples in the right child.

    ``N``, ``N_t``, ``N_t_R`` and ``N_t_L`` all refer to the weighted sum,
    if ``sample_weight`` is passed.

    .. versionadded:: 0.19

min_impurity_split : float, (default=1e-7)
    Threshold for early stopping in tree growth. A node will split
    if its impurity is above the threshold, otherwise it is a leaf.

    .. deprecated:: 0.19
       ``min_impurity_split`` has been deprecated in favor of
       ``min_impurity_decrease`` in 0.19. The default value of
       ``min_impurity_split`` will change from 1e-7 to 0 in 0.23 and it
       will be removed in 0.25. Use ``min_impurity_decrease`` instead.

bootstrap : boolean, optional (default=True)
    Whether bootstrap samples are used when building trees. If False, the
    whole datset is used to build each tree.

oob_score : bool, optional (default=False)
    whether to use out-of-bag samples to estimate
    the R^2 on unseen data.

n_jobs : int or None, optional (default=None)
    The number of jobs to run in parallel. :meth:`fit`, :meth:`predict`,
    :meth:`decision_path` and :meth:`apply` are all parallelized over the
    trees. ``None`` means 1 unless in a :obj:`joblib.parallel_backend`
    context. ``-1`` means using all processors. See :term:`Glossary
    <n_jobs>` for more details.

random_state : int, RandomState instance or None, optional (default=None)
    Controls both the randomness of the bootstrapping of the samples used
    when building trees (if ``bootstrap=True``) and the sampling of the
    features to consider when looking for the best split at each node
    (if ``max_features < n_features``).
    See :term:`Glossary <random_state>` for details.

verbose : int, optional (default=0)
    Controls the verbosity when fitting and predicting.

warm_start : bool, optional (default=False)
    When set to ``True``, reuse the solution of the previous call to fit
    and add more estimators to the ensemble, otherwise, just fit a whole
    new forest. See :term:`the Glossary <warm_start>`.

ccp_alpha : non-negative float, optional (default=0.0)
    Complexity parameter used for Minimal Cost-Complexity Pruning. The
    subtree with the largest cost complexity that is smaller than
    ``ccp_alpha`` will be chosen. By default, no pruning is performed. See
    :ref:`minimal_cost_complexity_pruning` for details.

    .. versionadded:: 0.22

max_samples : int or float, default=None
    If bootstrap is True, the number of samples to draw from X
    to train each base estimator.

    - If None (default), then draw `X.shape[0]` samples.
    - If int, then draw `max_samples` samples.
    - If float, then draw `max_samples * X.shape[0]` samples. Thus,
      `max_samples` should be in the interval `(0, 1)`.

    .. versionadded:: 0.22

Attributes
----------
base_estimator_ : DecisionTreeRegressor
    The child estimator template used to create the collection of fitted
    sub-estimators.

estimators_ : list of DecisionTreeRegressor
    The collection of fitted sub-estimators.

feature_importances_ : ndarray of shape (n_features,)
    The feature importances (the higher, the more important the feature).

n_features_ : int
    The number of features when ``fit`` is performed.

n_outputs_ : int
    The number of outputs when ``fit`` is performed.

oob_score_ : float
    Score of the training dataset obtained using an out-of-bag estimate.
    This attribute exists only when ``oob_score`` is True.

oob_prediction_ : ndarray of shape (n_samples,)
    Prediction computed with out-of-bag estimate on the training set.
    This attribute exists only when ``oob_score`` is True.

Examples
--------
>>> from sklearn.ensemble import RandomForestRegressor
>>> from sklearn.datasets import make_regression

>>> X, y = make_regression(n_features=4, n_informative=2,
...                        random_state=0, shuffle=False)
>>> regr = RandomForestRegressor(max_depth=2, random_state=0)
>>> regr.fit(X, y)
RandomForestRegressor(max_depth=2, random_state=0)
>>> print(regr.feature_importances_)
[0.18146984 0.81473937 0.00145312 0.00233767]
>>> print(regr.predict([[0, 0, 0, 0]]))
[-8.32987858]

Notes
-----
The default values for the parameters controlling the size of the trees
(e.g. ``max_depth``, ``min_samples_leaf``, etc.) lead to fully grown and
unpruned trees which can potentially be very large on some data sets. To
reduce memory consumption, the complexity and size of the trees should be
controlled by setting those parameter values.

The features are always randomly permuted at each split. Therefore,
the best found split may vary, even with the same training data,
``max_features=n_features`` and ``bootstrap=False``, if the improvement
of the criterion is identical for several splits enumerated during the
search of the best split. To obtain a deterministic behaviour during
fitting, ``random_state`` has to be fixed.

The default value ``max_features="auto"`` uses ``n_features``
rather than ``n_features / 3``. The latter was originally suggested in
[1], whereas the former was more recently justified empirically in [2].

References
----------

.. [1] L. Breiman, "Random Forests", Machine Learning, 45(1), 5-32, 2001.

.. [2] P. Geurts, D. Ernst., and L. Wehenkel, "Extremely randomized
       trees", Machine Learning, 63(1), 3-42, 2006.

See Also
--------
DecisionTreeRegressor, ExtraTreesRegressor
*)

val get_item : index:Py.Object.t -> t -> Py.Object.t
(**
Return the index'th estimator in the ensemble.
*)

val apply : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Apply trees in the forest to X, return leaf indices.

Parameters
----------
X : {array-like or sparse matrix} of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
X_leaves : array_like, shape = [n_samples, n_estimators]
    For each datapoint x in X and for each tree in the forest,
    return the index of the leaf x ends up in.
*)

val decision_path : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> (Py.Object.t * Py.Object.t)
(**
Return the decision path in the forest.

.. versionadded:: 0.18

Parameters
----------
X : {array-like or sparse matrix} of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
indicator : sparse csr array, shape = [n_samples, n_nodes]
    Return a node indicator matrix where non zero elements
    indicates that the samples goes through the nodes.

n_nodes_ptr : array of size (n_estimators + 1, )
    The columns from indicator[n_nodes_ptr[i]:n_nodes_ptr[i+1]]
    gives the indicator value for the i-th estimator.
*)

val fit : ?sample_weight:Ndarray.t -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> y:Ndarray.t -> t -> t
(**
Build a forest of trees from the training set (X, y).

Parameters
----------
X : array-like or sparse matrix of shape (n_samples, n_features)
    The training input samples. Internally, its dtype will be converted
    to ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csc_matrix``.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    The target values (class labels in classification, real numbers in
    regression).

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights. If None, then samples are equally weighted. Splits
    that would create child nodes with net zero or negative weight are
    ignored while searching for a split in each node. In the case of
    classification, splits are also ignored if they would result in any
    single class carrying a negative weight in either child node.

Returns
-------
self : object
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get parameters for this estimator.

Parameters
----------
deep : bool, default=True
    If True, will return the parameters for this estimator and
    contained subobjects that are estimators.

Returns
-------
params : mapping of string to any
    Parameter names mapped to their values.
*)

val predict : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict regression target for X.

The predicted regression target of an input sample is computed as the
mean predicted regression targets of the trees in the forest.

Parameters
----------
X : array-like or sparse matrix of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    The predicted values.
*)

val score : ?sample_weight:Ndarray.t -> x:Ndarray.t -> y:Ndarray.t -> t -> float
(**
Return the coefficient of determination R^2 of the prediction.

The coefficient R^2 is defined as (1 - u/v), where u is the residual
sum of squares ((y_true - y_pred) ** 2).sum() and v is the total
sum of squares ((y_true - y_true.mean()) ** 2).sum().
The best possible score is 1.0 and it can be negative (because the
model can be arbitrarily worse). A constant model that always
predicts the expected value of y, disregarding the input features,
would get a R^2 score of 0.0.

Parameters
----------
X : array-like of shape (n_samples, n_features)
    Test samples. For some estimators this may be a
    precomputed kernel matrix or a list of generic objects instead,
    shape = (n_samples, n_samples_fitted),
    where n_samples_fitted is the number of
    samples used in the fitting for the estimator.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    True values for X.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights.

Returns
-------
score : float
    R^2 of self.predict(X) wrt. y.

Notes
-----
The R2 score used when calling ``score`` on a regressor will use
``multioutput='uniform_average'`` from version 0.23 to keep consistent
with :func:`~sklearn.metrics.r2_score`. This will influence the
``score`` method of all the multioutput regressors (except for
:class:`~sklearn.multioutput.MultiOutputRegressor`). To specify the
default value manually and avoid the warning, please either call
:func:`~sklearn.metrics.r2_score` directly or make a custom scorer with
:func:`~sklearn.metrics.make_scorer` (the built-in scorer ``'r2'`` uses
``multioutput='uniform_average'``).
*)

val set_params : ?params:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of this estimator.

The method works on simple estimators as well as on nested objects
(such as pipelines). The latter have parameters of the form
``<component>__<parameter>`` so that it's possible to update each
component of a nested object.

Parameters
----------
**params : dict
    Estimator parameters.

Returns
-------
self : object
    Estimator instance.
*)


(** Attribute base_estimator_: see constructor for documentation *)
val base_estimator_ : t -> Py.Object.t

(** Attribute estimators_: see constructor for documentation *)
val estimators_ : t -> Py.Object.t

(** Attribute feature_importances_: see constructor for documentation *)
val feature_importances_ : t -> Ndarray.t

(** Attribute n_features_: see constructor for documentation *)
val n_features_ : t -> int

(** Attribute n_outputs_: see constructor for documentation *)
val n_outputs_ : t -> int

(** Attribute oob_score_: see constructor for documentation *)
val oob_score_ : t -> float

(** Attribute oob_prediction_: see constructor for documentation *)
val oob_prediction_ : t -> Ndarray.t

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module RandomTreesEmbedding : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?n_estimators:int -> ?max_depth:int -> ?min_samples_split:[`Int of int | `Float of float] -> ?min_samples_leaf:[`Int of int | `Float of float] -> ?min_weight_fraction_leaf:float -> ?max_leaf_nodes:[`Int of int | `None] -> ?min_impurity_decrease:float -> ?min_impurity_split:float -> ?sparse_output:bool -> ?n_jobs:[`Int of int | `None] -> ?random_state:[`Int of int | `RandomState of Py.Object.t | `None] -> ?verbose:int -> ?warm_start:bool -> unit -> t
(**
An ensemble of totally random trees.

An unsupervised transformation of a dataset to a high-dimensional
sparse representation. A datapoint is coded according to which leaf of
each tree it is sorted into. Using a one-hot encoding of the leaves,
this leads to a binary coding with as many ones as there are trees in
the forest.

The dimensionality of the resulting representation is
``n_out <= n_estimators * max_leaf_nodes``. If ``max_leaf_nodes == None``,
the number of leaf nodes is at most ``n_estimators * 2 ** max_depth``.

Read more in the :ref:`User Guide <random_trees_embedding>`.

Parameters
----------
n_estimators : integer, optional (default=10)
    Number of trees in the forest.

    .. versionchanged:: 0.22
       The default value of ``n_estimators`` changed from 10 to 100
       in 0.22.

max_depth : integer, optional (default=5)
    The maximum depth of each tree. If None, then nodes are expanded until
    all leaves are pure or until all leaves contain less than
    min_samples_split samples.

min_samples_split : int, float, optional (default=2)
    The minimum number of samples required to split an internal node:

    - If int, then consider `min_samples_split` as the minimum number.
    - If float, then `min_samples_split` is a fraction and
      `ceil(min_samples_split * n_samples)` is the minimum
      number of samples for each split.

    .. versionchanged:: 0.18
       Added float values for fractions.

min_samples_leaf : int, float, optional (default=1)
    The minimum number of samples required to be at a leaf node.
    A split point at any depth will only be considered if it leaves at
    least ``min_samples_leaf`` training samples in each of the left and
    right branches.  This may have the effect of smoothing the model,
    especially in regression.

    - If int, then consider `min_samples_leaf` as the minimum number.
    - If float, then `min_samples_leaf` is a fraction and
      `ceil(min_samples_leaf * n_samples)` is the minimum
      number of samples for each node.

    .. versionchanged:: 0.18
       Added float values for fractions.

min_weight_fraction_leaf : float, optional (default=0.)
    The minimum weighted fraction of the sum total of weights (of all
    the input samples) required to be at a leaf node. Samples have
    equal weight when sample_weight is not provided.

max_leaf_nodes : int or None, optional (default=None)
    Grow trees with ``max_leaf_nodes`` in best-first fashion.
    Best nodes are defined as relative reduction in impurity.
    If None then unlimited number of leaf nodes.

min_impurity_decrease : float, optional (default=0.)
    A node will be split if this split induces a decrease of the impurity
    greater than or equal to this value.

    The weighted impurity decrease equation is the following::

        N_t / N * (impurity - N_t_R / N_t * right_impurity
                            - N_t_L / N_t * left_impurity)

    where ``N`` is the total number of samples, ``N_t`` is the number of
    samples at the current node, ``N_t_L`` is the number of samples in the
    left child, and ``N_t_R`` is the number of samples in the right child.

    ``N``, ``N_t``, ``N_t_R`` and ``N_t_L`` all refer to the weighted sum,
    if ``sample_weight`` is passed.

    .. versionadded:: 0.19

min_impurity_split : float, (default=1e-7)
    Threshold for early stopping in tree growth. A node will split
    if its impurity is above the threshold, otherwise it is a leaf.

    .. deprecated:: 0.19
       ``min_impurity_split`` has been deprecated in favor of
       ``min_impurity_decrease`` in 0.19. The default value of
       ``min_impurity_split`` will change from 1e-7 to 0 in 0.23 and it
       will be removed in 0.25. Use ``min_impurity_decrease`` instead.

sparse_output : bool, optional (default=True)
    Whether or not to return a sparse CSR matrix, as default behavior,
    or to return a dense array compatible with dense pipeline operators.

n_jobs : int or None, optional (default=None)
    The number of jobs to run in parallel. :meth:`fit`, :meth:`transform`,
    :meth:`decision_path` and :meth:`apply` are all parallelized over the
    trees. ``None`` means 1 unless in a :obj:`joblib.parallel_backend`
    context. ``-1`` means using all processors. See :term:`Glossary
    <n_jobs>` for more details.

random_state : int, RandomState instance or None, optional (default=None)
    Controls the generation of the random `y` used to fit the trees
    and the draw of the splits for each feature at the trees' nodes.
    See :term:`Glossary <random_state>` for details.

verbose : int, optional (default=0)
    Controls the verbosity when fitting and predicting.

warm_start : bool, optional (default=False)
    When set to ``True``, reuse the solution of the previous call to fit
    and add more estimators to the ensemble, otherwise, just fit a whole
    new forest. See :term:`the Glossary <warm_start>`.

Attributes
----------
estimators_ : list of DecisionTreeClassifier
    The collection of fitted sub-estimators.

References
----------
.. [1] P. Geurts, D. Ernst., and L. Wehenkel, "Extremely randomized trees",
       Machine Learning, 63(1), 3-42, 2006.
.. [2] Moosmann, F. and Triggs, B. and Jurie, F.  "Fast discriminative
       visual codebooks using randomized clustering forests"
       NIPS 2007
*)

val get_item : index:Py.Object.t -> t -> Py.Object.t
(**
Return the index'th estimator in the ensemble.
*)

val apply : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Apply trees in the forest to X, return leaf indices.

Parameters
----------
X : {array-like or sparse matrix} of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
X_leaves : array_like, shape = [n_samples, n_estimators]
    For each datapoint x in X and for each tree in the forest,
    return the index of the leaf x ends up in.
*)

val decision_path : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> (Py.Object.t * Py.Object.t)
(**
Return the decision path in the forest.

.. versionadded:: 0.18

Parameters
----------
X : {array-like or sparse matrix} of shape (n_samples, n_features)
    The input samples. Internally, its dtype will be converted to
    ``dtype=np.float32``. If a sparse matrix is provided, it will be
    converted into a sparse ``csr_matrix``.

Returns
-------
indicator : sparse csr array, shape = [n_samples, n_nodes]
    Return a node indicator matrix where non zero elements
    indicates that the samples goes through the nodes.

n_nodes_ptr : array of size (n_estimators + 1, )
    The columns from indicator[n_nodes_ptr[i]:n_nodes_ptr[i+1]]
    gives the indicator value for the i-th estimator.
*)

val fit : ?y:Py.Object.t -> ?sample_weight:Ndarray.t -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> t
(**
Fit estimator.

Parameters
----------
X : array-like or sparse matrix, shape=(n_samples, n_features)
    The input samples. Use ``dtype=np.float32`` for maximum
    efficiency. Sparse matrices are also supported, use sparse
    ``csc_matrix`` for maximum efficiency.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights. If None, then samples are equally weighted. Splits
    that would create child nodes with net zero or negative weight are
    ignored while searching for a split in each node. In the case of
    classification, splits are also ignored if they would result in any
    single class carrying a negative weight in either child node.

Returns
-------
self : object
*)

val fit_transform : ?y:Py.Object.t -> ?sample_weight:Ndarray.t -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Fit estimator and transform dataset.

Parameters
----------
X : array-like or sparse matrix, shape=(n_samples, n_features)
    Input data used to build forests. Use ``dtype=np.float32`` for
    maximum efficiency.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights. If None, then samples are equally weighted. Splits
    that would create child nodes with net zero or negative weight are
    ignored while searching for a split in each node. In the case of
    classification, splits are also ignored if they would result in any
    single class carrying a negative weight in either child node.

Returns
-------
X_transformed : sparse matrix, shape=(n_samples, n_out)
    Transformed dataset.
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get parameters for this estimator.

Parameters
----------
deep : bool, default=True
    If True, will return the parameters for this estimator and
    contained subobjects that are estimators.

Returns
-------
params : mapping of string to any
    Parameter names mapped to their values.
*)

val set_params : ?params:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of this estimator.

The method works on simple estimators as well as on nested objects
(such as pipelines). The latter have parameters of the form
``<component>__<parameter>`` so that it's possible to update each
component of a nested object.

Parameters
----------
**params : dict
    Estimator parameters.

Returns
-------
self : object
    Estimator instance.
*)

val transform : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Transform dataset.

Parameters
----------
X : array-like or sparse matrix, shape=(n_samples, n_features)
    Input data to be transformed. Use ``dtype=np.float32`` for maximum
    efficiency. Sparse matrices are also supported, use sparse
    ``csr_matrix`` for maximum efficiency.

Returns
-------
X_transformed : sparse matrix, shape=(n_samples, n_out)
    Transformed dataset.
*)


(** Attribute estimators_: see constructor for documentation *)
val estimators_ : t -> Py.Object.t

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module StackingClassifier : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?final_estimator:Py.Object.t -> ?cv:[`Int of int | `CrossValGenerator of Py.Object.t | `Ndarray of Ndarray.t] -> ?stack_method:[`Auto | `Predict_proba | `Decision_function | `Predict] -> ?n_jobs:int -> ?passthrough:bool -> ?verbose:Py.Object.t -> estimators:Py.Object.t -> unit -> t
(**
Stack of estimators with a final classifier.

Stacked generalization consists in stacking the output of individual
estimator and use a classifier to compute the final prediction. Stacking
allows to use the strength of each individual estimator by using their
output as input of a final estimator.

Note that `estimators_` are fitted on the full `X` while `final_estimator_`
is trained using cross-validated predictions of the base estimators using
`cross_val_predict`.

.. versionadded:: 0.22

Read more in the :ref:`User Guide <stacking>`.

Parameters
----------
estimators : list of (str, estimator)
    Base estimators which will be stacked together. Each element of the
    list is defined as a tuple of string (i.e. name) and an estimator
    instance. An estimator can be set to 'drop' using `set_params`.

final_estimator : estimator, default=None
    A classifier which will be used to combine the base estimators.
    The default classifier is a `LogisticRegression`.

cv : int, cross-validation generator or an iterable, default=None
    Determines the cross-validation splitting strategy used in
    `cross_val_predict` to train `final_estimator`. Possible inputs for
    cv are:

    * None, to use the default 5-fold cross validation,
    * integer, to specify the number of folds in a (Stratified) KFold,
    * An object to be used as a cross-validation generator,
    * An iterable yielding train, test splits.

    For integer/None inputs, if the estimator is a classifier and y is
    either binary or multiclass, `StratifiedKFold` is used. In all other
    cases, `KFold` is used.

    Refer :ref:`User Guide <cross_validation>` for the various
    cross-validation strategies that can be used here.

    .. note::
       A larger number of split will provide no benefits if the number
       of training samples is large enough. Indeed, the training time
       will increase. ``cv`` is not used for model evaluation but for
       prediction.

stack_method : {'auto', 'predict_proba', 'decision_function', 'predict'},             default='auto'
    Methods called for each base estimator. It can be:

    * if 'auto', it will try to invoke, for each estimator,
      `'predict_proba'`, `'decision_function'` or `'predict'` in that
      order.
    * otherwise, one of `'predict_proba'`, `'decision_function'` or
      `'predict'`. If the method is not implemented by the estimator, it
      will raise an error.

n_jobs : int, default=None
    The number of jobs to run in parallel all `estimators` `fit`.
    `None` means 1 unless in a `joblib.parallel_backend` context. -1 means
    using all processors. See Glossary for more details.

passthrough : bool, default=False
    When False, only the predictions of estimators will be used as
    training data for `final_estimator`. When True, the
    `final_estimator` is trained on the predictions as well as the
    original training data.

Attributes
----------
estimators_ : list of estimators
    The elements of the estimators parameter, having been fitted on the
    training data. If an estimator has been set to `'drop'`, it
    will not appear in `estimators_`.

named_estimators_ : Bunch
    Attribute to access any fitted sub-estimators by name.

final_estimator_ : estimator
    The classifier which predicts given the output of `estimators_`.

stack_method_ : list of str
    The method used by each base estimator.

Notes
-----
When `predict_proba` is used by each estimator (i.e. most of the time for
`stack_method='auto'` or specifically for `stack_method='predict_proba'`),
The first column predicted by each estimator will be dropped in the case
of a binary classification problem. Indeed, both feature will be perfectly
collinear.

References
----------
.. [1] Wolpert, David H. "Stacked generalization." Neural networks 5.2
   (1992): 241-259.

Examples
--------
>>> from sklearn.datasets import load_iris
>>> from sklearn.ensemble import RandomForestClassifier
>>> from sklearn.svm import LinearSVC
>>> from sklearn.linear_model import LogisticRegression
>>> from sklearn.preprocessing import StandardScaler
>>> from sklearn.pipeline import make_pipeline
>>> from sklearn.ensemble import StackingClassifier
>>> X, y = load_iris(return_X_y=True)
>>> estimators = [
...     ('rf', RandomForestClassifier(n_estimators=10, random_state=42)),
...     ('svr', make_pipeline(StandardScaler(),
...                           LinearSVC(random_state=42)))
... ]
>>> clf = StackingClassifier(
...     estimators=estimators, final_estimator=LogisticRegression()
... )
>>> from sklearn.model_selection import train_test_split
>>> X_train, X_test, y_train, y_test = train_test_split(
...     X, y, stratify=y, random_state=42
... )
>>> clf.fit(X_train, y_train).score(X_test, y_test)
0.9...
*)

val decision_function : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict decision function for samples in X using
`final_estimator_.decision_function`.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    Training vectors, where n_samples is the number of samples and
    n_features is the number of features.

Returns
-------
decisions : ndarray of shape (n_samples,), (n_samples, n_classes),             or (n_samples, n_classes * (n_classes-1) / 2)
    The decision function computed the final estimator.
*)

val fit : ?sample_weight:[`Ndarray of Ndarray.t | `None] -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> y:Ndarray.t -> t -> t
(**
Fit the estimators.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    Training vectors, where `n_samples` is the number of samples and
    `n_features` is the number of features.

y : array-like of shape (n_samples,)
    Target values.

sample_weight : array-like of shape (n_samples,) or None
    Sample weights. If None, then samples are equally weighted.
    Note that this is supported only if all underlying estimators
    support sample weights.

Returns
-------
self : object
*)

val fit_transform : ?y:Ndarray.t -> ?fit_params:(string * Py.Object.t) list -> x:Ndarray.t -> t -> Ndarray.t
(**
Fit to data, then transform it.

Fits transformer to X and y with optional parameters fit_params
and returns a transformed version of X.

Parameters
----------
X : numpy array of shape [n_samples, n_features]
    Training set.

y : numpy array of shape [n_samples]
    Target values.

**fit_params : dict
    Additional fit parameters.

Returns
-------
X_new : numpy array of shape [n_samples, n_features_new]
    Transformed array.
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get the parameters of an estimator from the ensemble.

Parameters
----------
deep : bool
    Setting it to True gets the various classifiers and the parameters
    of the classifiers as well.
*)

val predict : ?predict_params:(string * Py.Object.t) list -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict target for X.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    Training vectors, where n_samples is the number of samples and
    n_features is the number of features.

**predict_params : dict of str -> obj
    Parameters to the `predict` called by the `final_estimator`. Note
    that this may be used to return uncertainties from some estimators
    with `return_std` or `return_cov`. Be aware that it will only
    accounts for uncertainty in the final estimator.

Returns
-------
y_pred : ndarray of shape (n_samples,) or (n_samples, n_output)
    Predicted targets.
*)

val predict_proba : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict class probabilities for X using
`final_estimator_.predict_proba`.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    Training vectors, where n_samples is the number of samples and
    n_features is the number of features.

Returns
-------
probabilities : ndarray of shape (n_samples, n_classes) or             list of ndarray of shape (n_output,)
    The class probabilities of the input samples.
*)

val score : ?sample_weight:Ndarray.t -> x:Ndarray.t -> y:Ndarray.t -> t -> float
(**
Return the mean accuracy on the given test data and labels.

In multi-label classification, this is the subset accuracy
which is a harsh metric since you require for each sample that
each label set be correctly predicted.

Parameters
----------
X : array-like of shape (n_samples, n_features)
    Test samples.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    True labels for X.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights.

Returns
-------
score : float
    Mean accuracy of self.predict(X) wrt. y.
*)

val set_params : ?params:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of an estimator from the ensemble.

Valid parameter keys can be listed with `get_params()`.

Parameters
----------
**params : keyword arguments
    Specific parameters using e.g.
    `set_params(parameter_name=new_value)`. In addition, to setting the
    parameters of the stacking estimator, the individual estimator of
    the stacking estimators can also be set, or can be removed by
    setting them to 'drop'.
*)

val transform : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Return class labels or probabilities for X for each estimator.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    Training vectors, where `n_samples` is the number of samples and
    `n_features` is the number of features.

Returns
-------
y_preds : ndarray of shape (n_samples, n_estimators) or                 (n_samples, n_classes * n_estimators)
    Prediction outputs for each estimator.
*)


(** Attribute estimators_: see constructor for documentation *)
val estimators_ : t -> Py.Object.t

(** Attribute named_estimators_: see constructor for documentation *)
val named_estimators_ : t -> Py.Object.t

(** Attribute final_estimator_: see constructor for documentation *)
val final_estimator_ : t -> Py.Object.t

(** Attribute stack_method_: see constructor for documentation *)
val stack_method_ : t -> string list

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module StackingRegressor : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?final_estimator:Py.Object.t -> ?cv:[`Int of int | `CrossValGenerator of Py.Object.t | `Ndarray of Ndarray.t] -> ?n_jobs:int -> ?passthrough:bool -> ?verbose:Py.Object.t -> estimators:Py.Object.t -> unit -> t
(**
Stack of estimators with a final regressor.

Stacked generalization consists in stacking the output of individual
estimator and use a regressor to compute the final prediction. Stacking
allows to use the strength of each individual estimator by using their
output as input of a final estimator.

Note that `estimators_` are fitted on the full `X` while `final_estimator_`
is trained using cross-validated predictions of the base estimators using
`cross_val_predict`.

.. versionadded:: 0.22

Read more in the :ref:`User Guide <stacking>`.

Parameters
----------
estimators : list of (str, estimator)
    Base estimators which will be stacked together. Each element of the
    list is defined as a tuple of string (i.e. name) and an estimator
    instance. An estimator can be set to 'drop' using `set_params`.

final_estimator : estimator, default=None
    A regressor which will be used to combine the base estimators.
    The default regressor is a `RidgeCV`.

cv : int, cross-validation generator or an iterable, default=None
    Determines the cross-validation splitting strategy used in
    `cross_val_predict` to train `final_estimator`. Possible inputs for
    cv are:

    * None, to use the default 5-fold cross validation,
    * integer, to specify the number of folds in a (Stratified) KFold,
    * An object to be used as a cross-validation generator,
    * An iterable yielding train, test splits.

    For integer/None inputs, if the estimator is a classifier and y is
    either binary or multiclass, `StratifiedKFold` is used. In all other
    cases, `KFold` is used.

    Refer :ref:`User Guide <cross_validation>` for the various
    cross-validation strategies that can be used here.

    .. note::
       A larger number of split will provide no benefits if the number
       of training samples is large enough. Indeed, the training time
       will increase. ``cv`` is not used for model evaluation but for
       prediction.

n_jobs : int, default=None
    The number of jobs to run in parallel for `fit` of all `estimators`.
    `None` means 1 unless in a `joblib.parallel_backend` context. -1 means
    using all processors. See Glossary for more details.

passthrough : bool, default=False
    When False, only the predictions of estimators will be used as
    training data for `final_estimator`. When True, the
    `final_estimator` is trained on the predictions as well as the
    original training data.

Attributes
----------
estimators_ : list of estimator
    The elements of the estimators parameter, having been fitted on the
    training data. If an estimator has been set to `'drop'`, it
    will not appear in `estimators_`.

named_estimators_ : Bunch
    Attribute to access any fitted sub-estimators by name.

final_estimator_ : estimator
    The regressor to stacked the base estimators fitted.

References
----------
.. [1] Wolpert, David H. "Stacked generalization." Neural networks 5.2
   (1992): 241-259.

Examples
--------
>>> from sklearn.datasets import load_diabetes
>>> from sklearn.linear_model import RidgeCV
>>> from sklearn.svm import LinearSVR
>>> from sklearn.ensemble import RandomForestRegressor
>>> from sklearn.ensemble import StackingRegressor
>>> X, y = load_diabetes(return_X_y=True)
>>> estimators = [
...     ('lr', RidgeCV()),
...     ('svr', LinearSVR(random_state=42))
... ]
>>> reg = StackingRegressor(
...     estimators=estimators,
...     final_estimator=RandomForestRegressor(n_estimators=10,
...                                           random_state=42)
... )
>>> from sklearn.model_selection import train_test_split
>>> X_train, X_test, y_train, y_test = train_test_split(
...     X, y, random_state=42
... )
>>> reg.fit(X_train, y_train).score(X_test, y_test)
0.3...
*)

val fit : ?sample_weight:[`Ndarray of Ndarray.t | `None] -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> y:Ndarray.t -> t -> t
(**
Fit the estimators.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    Training vectors, where n_samples is the number of samples and
    n_features is the number of features.

y : array-like of shape (n_samples,)
    Target values.

sample_weight : array-like of shape (n_samples,) or None
    Sample weights. If None, then samples are equally weighted.
    Note that this is supported only if all underlying estimators
    support sample weights.

Returns
-------
self : object
*)

val fit_transform : ?y:Ndarray.t -> ?fit_params:(string * Py.Object.t) list -> x:Ndarray.t -> t -> Ndarray.t
(**
Fit to data, then transform it.

Fits transformer to X and y with optional parameters fit_params
and returns a transformed version of X.

Parameters
----------
X : numpy array of shape [n_samples, n_features]
    Training set.

y : numpy array of shape [n_samples]
    Target values.

**fit_params : dict
    Additional fit parameters.

Returns
-------
X_new : numpy array of shape [n_samples, n_features_new]
    Transformed array.
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get the parameters of an estimator from the ensemble.

Parameters
----------
deep : bool
    Setting it to True gets the various classifiers and the parameters
    of the classifiers as well.
*)

val predict : ?predict_params:(string * Py.Object.t) list -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict target for X.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    Training vectors, where n_samples is the number of samples and
    n_features is the number of features.

**predict_params : dict of str -> obj
    Parameters to the `predict` called by the `final_estimator`. Note
    that this may be used to return uncertainties from some estimators
    with `return_std` or `return_cov`. Be aware that it will only
    accounts for uncertainty in the final estimator.

Returns
-------
y_pred : ndarray of shape (n_samples,) or (n_samples, n_output)
    Predicted targets.
*)

val score : ?sample_weight:Ndarray.t -> x:Ndarray.t -> y:Ndarray.t -> t -> float
(**
Return the coefficient of determination R^2 of the prediction.

The coefficient R^2 is defined as (1 - u/v), where u is the residual
sum of squares ((y_true - y_pred) ** 2).sum() and v is the total
sum of squares ((y_true - y_true.mean()) ** 2).sum().
The best possible score is 1.0 and it can be negative (because the
model can be arbitrarily worse). A constant model that always
predicts the expected value of y, disregarding the input features,
would get a R^2 score of 0.0.

Parameters
----------
X : array-like of shape (n_samples, n_features)
    Test samples. For some estimators this may be a
    precomputed kernel matrix or a list of generic objects instead,
    shape = (n_samples, n_samples_fitted),
    where n_samples_fitted is the number of
    samples used in the fitting for the estimator.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    True values for X.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights.

Returns
-------
score : float
    R^2 of self.predict(X) wrt. y.

Notes
-----
The R2 score used when calling ``score`` on a regressor will use
``multioutput='uniform_average'`` from version 0.23 to keep consistent
with :func:`~sklearn.metrics.r2_score`. This will influence the
``score`` method of all the multioutput regressors (except for
:class:`~sklearn.multioutput.MultiOutputRegressor`). To specify the
default value manually and avoid the warning, please either call
:func:`~sklearn.metrics.r2_score` directly or make a custom scorer with
:func:`~sklearn.metrics.make_scorer` (the built-in scorer ``'r2'`` uses
``multioutput='uniform_average'``).
*)

val set_params : ?params:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of an estimator from the ensemble.

Valid parameter keys can be listed with `get_params()`.

Parameters
----------
**params : keyword arguments
    Specific parameters using e.g.
    `set_params(parameter_name=new_value)`. In addition, to setting the
    parameters of the stacking estimator, the individual estimator of
    the stacking estimators can also be set, or can be removed by
    setting them to 'drop'.
*)

val transform : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Return the predictions for X for each estimator.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    Training vectors, where `n_samples` is the number of samples and
    `n_features` is the number of features.

Returns
-------
y_preds : ndarray of shape (n_samples, n_estimators)
    Prediction outputs for each estimator.
*)


(** Attribute estimators_: see constructor for documentation *)
val estimators_ : t -> Py.Object.t

(** Attribute named_estimators_: see constructor for documentation *)
val named_estimators_ : t -> Py.Object.t

(** Attribute final_estimator_: see constructor for documentation *)
val final_estimator_ : t -> Py.Object.t

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module VotingClassifier : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?voting:[`Hard | `Soft] -> ?weights:Ndarray.t -> ?n_jobs:[`Int of int | `None] -> ?flatten_transform:bool -> estimators:Py.Object.t -> unit -> t
(**
Soft Voting/Majority Rule classifier for unfitted estimators.

.. versionadded:: 0.17

Read more in the :ref:`User Guide <voting_classifier>`.

Parameters
----------
estimators : list of (str, estimator) tuples
    Invoking the ``fit`` method on the ``VotingClassifier`` will fit clones
    of those original estimators that will be stored in the class attribute
    ``self.estimators_``. An estimator can be set to ``'drop'``
    using ``set_params``.

    .. deprecated:: 0.22
       Using ``None`` to drop an estimator is deprecated in 0.22 and
       support will be dropped in 0.24. Use the string ``'drop'`` instead.

voting : str, {'hard', 'soft'} (default='hard')
    If 'hard', uses predicted class labels for majority rule voting.
    Else if 'soft', predicts the class label based on the argmax of
    the sums of the predicted probabilities, which is recommended for
    an ensemble of well-calibrated classifiers.

weights : array-like, shape (n_classifiers,), optional (default=`None`)
    Sequence of weights (`float` or `int`) to weight the occurrences of
    predicted class labels (`hard` voting) or class probabilities
    before averaging (`soft` voting). Uses uniform weights if `None`.

n_jobs : int or None, optional (default=None)
    The number of jobs to run in parallel for ``fit``.
    ``None`` means 1 unless in a :obj:`joblib.parallel_backend` context.
    ``-1`` means using all processors. See :term:`Glossary <n_jobs>`
    for more details.

flatten_transform : bool, optional (default=True)
    Affects shape of transform output only when voting='soft'
    If voting='soft' and flatten_transform=True, transform method returns
    matrix with shape (n_samples, n_classifiers * n_classes). If
    flatten_transform=False, it returns
    (n_classifiers, n_samples, n_classes).

Attributes
----------
estimators_ : list of classifiers
    The collection of fitted sub-estimators as defined in ``estimators``
    that are not 'drop'.

named_estimators_ : Bunch object, a dictionary with attribute access
    Attribute to access any fitted sub-estimators by name.

    .. versionadded:: 0.20

classes_ : array-like, shape (n_predictions,)
    The classes labels.

See Also
--------
VotingRegressor: Prediction voting regressor.

Examples
--------
>>> import numpy as np
>>> from sklearn.linear_model import LogisticRegression
>>> from sklearn.naive_bayes import GaussianNB
>>> from sklearn.ensemble import RandomForestClassifier, VotingClassifier
>>> clf1 = LogisticRegression(multi_class='multinomial', random_state=1)
>>> clf2 = RandomForestClassifier(n_estimators=50, random_state=1)
>>> clf3 = GaussianNB()
>>> X = np.array([[-1, -1], [-2, -1], [-3, -2], [1, 1], [2, 1], [3, 2]])
>>> y = np.array([1, 1, 1, 2, 2, 2])
>>> eclf1 = VotingClassifier(estimators=[
...         ('lr', clf1), ('rf', clf2), ('gnb', clf3)], voting='hard')
>>> eclf1 = eclf1.fit(X, y)
>>> print(eclf1.predict(X))
[1 1 1 2 2 2]
>>> np.array_equal(eclf1.named_estimators_.lr.predict(X),
...                eclf1.named_estimators_['lr'].predict(X))
True
>>> eclf2 = VotingClassifier(estimators=[
...         ('lr', clf1), ('rf', clf2), ('gnb', clf3)],
...         voting='soft')
>>> eclf2 = eclf2.fit(X, y)
>>> print(eclf2.predict(X))
[1 1 1 2 2 2]
>>> eclf3 = VotingClassifier(estimators=[
...        ('lr', clf1), ('rf', clf2), ('gnb', clf3)],
...        voting='soft', weights=[2,1,1],
...        flatten_transform=True)
>>> eclf3 = eclf3.fit(X, y)
>>> print(eclf3.predict(X))
[1 1 1 2 2 2]
>>> print(eclf3.transform(X).shape)
(6, 6)
*)

val fit : ?sample_weight:[`Ndarray of Ndarray.t | `None] -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> y:Ndarray.t -> t -> t
(**
Fit the estimators.

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    Training vectors, where n_samples is the number of samples and
    n_features is the number of features.

y : array-like, shape (n_samples,)
    Target values.

sample_weight : array-like, shape (n_samples,) or None
    Sample weights. If None, then samples are equally weighted.
    Note that this is supported only if all underlying estimators
    support sample weights.

Returns
-------
self : object
*)

val fit_transform : ?y:Ndarray.t -> ?fit_params:(string * Py.Object.t) list -> x:Ndarray.t -> t -> Ndarray.t
(**
Fit to data, then transform it.

Fits transformer to X and y with optional parameters fit_params
and returns a transformed version of X.

Parameters
----------
X : numpy array of shape [n_samples, n_features]
    Training set.

y : numpy array of shape [n_samples]
    Target values.

**fit_params : dict
    Additional fit parameters.

Returns
-------
X_new : numpy array of shape [n_samples, n_features_new]
    Transformed array.
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get the parameters of an estimator from the ensemble.

Parameters
----------
deep : bool
    Setting it to True gets the various classifiers and the parameters
    of the classifiers as well.
*)

val predict : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict class labels for X.

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    The input samples.

Returns
-------
maj : array-like, shape (n_samples,)
    Predicted class labels.
*)

val score : ?sample_weight:Ndarray.t -> x:Ndarray.t -> y:Ndarray.t -> t -> float
(**
Return the mean accuracy on the given test data and labels.

In multi-label classification, this is the subset accuracy
which is a harsh metric since you require for each sample that
each label set be correctly predicted.

Parameters
----------
X : array-like of shape (n_samples, n_features)
    Test samples.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    True labels for X.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights.

Returns
-------
score : float
    Mean accuracy of self.predict(X) wrt. y.
*)

val set_params : ?params:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of an estimator from the ensemble.

Valid parameter keys can be listed with `get_params()`.

Parameters
----------
**params : keyword arguments
    Specific parameters using e.g.
    `set_params(parameter_name=new_value)`. In addition, to setting the
    parameters of the stacking estimator, the individual estimator of
    the stacking estimators can also be set, or can be removed by
    setting them to 'drop'.
*)

val transform : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Return class labels or probabilities for X for each estimator.

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    Training vectors, where n_samples is the number of samples and
    n_features is the number of features.

Returns
-------
probabilities_or_labels
    If `voting='soft'` and `flatten_transform=True`:
        returns array-like of shape (n_classifiers, n_samples *
        n_classes), being class probabilities calculated by each
        classifier.
    If `voting='soft' and `flatten_transform=False`:
        array-like of shape (n_classifiers, n_samples, n_classes)
    If `voting='hard'`:
        array-like of shape (n_samples, n_classifiers), being
        class labels predicted by each classifier.
*)


(** Attribute estimators_: see constructor for documentation *)
val estimators_ : t -> Py.Object.t

(** Attribute named_estimators_: see constructor for documentation *)
val named_estimators_ : t -> Py.Object.t

(** Attribute classes_: see constructor for documentation *)
val classes_ : t -> Ndarray.t

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module VotingRegressor : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?weights:Ndarray.t -> ?n_jobs:[`Int of int | `None] -> estimators:Py.Object.t -> unit -> t
(**
Prediction voting regressor for unfitted estimators.

.. versionadded:: 0.21

A voting regressor is an ensemble meta-estimator that fits base
regressors each on the whole dataset. It, then, averages the individual
predictions to form a final prediction.

Read more in the :ref:`User Guide <voting_regressor>`.

Parameters
----------
estimators : list of (str, estimator) tuples
    Invoking the ``fit`` method on the ``VotingRegressor`` will fit clones
    of those original estimators that will be stored in the class attribute
    ``self.estimators_``. An estimator can be set to ``'drop'`` using
    ``set_params``.

    .. deprecated:: 0.22
       Using ``None`` to drop an estimator is deprecated in 0.22 and
       support will be dropped in 0.24. Use the string ``'drop'`` instead.

weights : array-like, shape (n_regressors,), optional (default=`None`)
    Sequence of weights (`float` or `int`) to weight the occurrences of
    predicted values before averaging. Uses uniform weights if `None`.

n_jobs : int or None, optional (default=None)
    The number of jobs to run in parallel for ``fit``.
    ``None`` means 1 unless in a :obj:`joblib.parallel_backend` context.
    ``-1`` means using all processors. See :term:`Glossary <n_jobs>`
    for more details.

Attributes
----------
estimators_ : list of regressors
    The collection of fitted sub-estimators as defined in ``estimators``
    that are not 'drop'.

named_estimators_ : Bunch object, a dictionary with attribute access
    Attribute to access any fitted sub-estimators by name.

    .. versionadded:: 0.20

See Also
--------
VotingClassifier: Soft Voting/Majority Rule classifier.

Examples
--------
>>> import numpy as np
>>> from sklearn.linear_model import LinearRegression
>>> from sklearn.ensemble import RandomForestRegressor
>>> from sklearn.ensemble import VotingRegressor
>>> r1 = LinearRegression()
>>> r2 = RandomForestRegressor(n_estimators=10, random_state=1)
>>> X = np.array([[1, 1], [2, 4], [3, 9], [4, 16], [5, 25], [6, 36]])
>>> y = np.array([2, 6, 12, 20, 30, 42])
>>> er = VotingRegressor([('lr', r1), ('rf', r2)])
>>> print(er.fit(X, y).predict(X))
[ 3.3  5.7 11.8 19.7 28.  40.3]
*)

val fit : ?sample_weight:[`Ndarray of Ndarray.t | `None] -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> y:Ndarray.t -> t -> t
(**
Fit the estimators.

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    Training vectors, where n_samples is the number of samples and
    n_features is the number of features.

y : array-like, shape (n_samples,)
    Target values.

sample_weight : array-like, shape (n_samples,) or None
    Sample weights. If None, then samples are equally weighted.
    Note that this is supported only if all underlying estimators
    support sample weights.

Returns
-------
self : object
    Fitted estimator.
*)

val fit_transform : ?y:Ndarray.t -> ?fit_params:(string * Py.Object.t) list -> x:Ndarray.t -> t -> Ndarray.t
(**
Fit to data, then transform it.

Fits transformer to X and y with optional parameters fit_params
and returns a transformed version of X.

Parameters
----------
X : numpy array of shape [n_samples, n_features]
    Training set.

y : numpy array of shape [n_samples]
    Target values.

**fit_params : dict
    Additional fit parameters.

Returns
-------
X_new : numpy array of shape [n_samples, n_features_new]
    Transformed array.
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get the parameters of an estimator from the ensemble.

Parameters
----------
deep : bool
    Setting it to True gets the various classifiers and the parameters
    of the classifiers as well.
*)

val predict : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict regression target for X.

The predicted regression target of an input sample is computed as the
mean predicted regression targets of the estimators in the ensemble.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    The input samples.

Returns
-------
y : array of shape (n_samples,)
    The predicted values.
*)

val score : ?sample_weight:Ndarray.t -> x:Ndarray.t -> y:Ndarray.t -> t -> float
(**
Return the coefficient of determination R^2 of the prediction.

The coefficient R^2 is defined as (1 - u/v), where u is the residual
sum of squares ((y_true - y_pred) ** 2).sum() and v is the total
sum of squares ((y_true - y_true.mean()) ** 2).sum().
The best possible score is 1.0 and it can be negative (because the
model can be arbitrarily worse). A constant model that always
predicts the expected value of y, disregarding the input features,
would get a R^2 score of 0.0.

Parameters
----------
X : array-like of shape (n_samples, n_features)
    Test samples. For some estimators this may be a
    precomputed kernel matrix or a list of generic objects instead,
    shape = (n_samples, n_samples_fitted),
    where n_samples_fitted is the number of
    samples used in the fitting for the estimator.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    True values for X.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights.

Returns
-------
score : float
    R^2 of self.predict(X) wrt. y.

Notes
-----
The R2 score used when calling ``score`` on a regressor will use
``multioutput='uniform_average'`` from version 0.23 to keep consistent
with :func:`~sklearn.metrics.r2_score`. This will influence the
``score`` method of all the multioutput regressors (except for
:class:`~sklearn.multioutput.MultiOutputRegressor`). To specify the
default value manually and avoid the warning, please either call
:func:`~sklearn.metrics.r2_score` directly or make a custom scorer with
:func:`~sklearn.metrics.make_scorer` (the built-in scorer ``'r2'`` uses
``multioutput='uniform_average'``).
*)

val set_params : ?params:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of an estimator from the ensemble.

Valid parameter keys can be listed with `get_params()`.

Parameters
----------
**params : keyword arguments
    Specific parameters using e.g.
    `set_params(parameter_name=new_value)`. In addition, to setting the
    parameters of the stacking estimator, the individual estimator of
    the stacking estimators can also be set, or can be removed by
    setting them to 'drop'.
*)

val transform : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Return predictions for X for each estimator.

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    The input samples.

Returns
-------
predictions: array of shape (n_samples, n_classifiers)
    Values predicted by each regressor.
*)


(** Attribute estimators_: see constructor for documentation *)
val estimators_ : t -> Py.Object.t

(** Attribute named_estimators_: see constructor for documentation *)
val named_estimators_ : t -> Py.Object.t

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module Partial_dependence : sig
module Parallel : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?n_jobs:int -> ?backend:Py.Object.t -> ?verbose:int -> ?timeout:float -> ?pre_dispatch:[`All | `Int of int | `PyObject of Py.Object.t] -> ?batch_size:[`Int of int | `Auto] -> ?temp_folder:string -> ?max_nbytes:Py.Object.t -> ?mmap_mode:[`R_ | `R | `W_ | `C | `None] -> ?prefer:[`Processes | `Threads | `None] -> ?require:[`Sharedmem | `None] -> unit -> t
(**
Helper class for readable parallel mapping.

Read more in the :ref:`User Guide <parallel>`.

Parameters
-----------
n_jobs: int, default: None
    The maximum number of concurrently running jobs, such as the number
    of Python worker processes when backend="multiprocessing"
    or the size of the thread-pool when backend="threading".
    If -1 all CPUs are used. If 1 is given, no parallel computing code
    is used at all, which is useful for debugging. For n_jobs below -1,
    (n_cpus + 1 + n_jobs) are used. Thus for n_jobs = -2, all
    CPUs but one are used.
    None is a marker for 'unset' that will be interpreted as n_jobs=1
    (sequential execution) unless the call is performed under a
    parallel_backend context manager that sets another value for
    n_jobs.
backend: str, ParallelBackendBase instance or None, default: 'loky'
    Specify the parallelization backend implementation.
    Supported backends are:

    - "loky" used by default, can induce some
      communication and memory overhead when exchanging input and
      output data with the worker Python processes.
    - "multiprocessing" previous process-based backend based on
      `multiprocessing.Pool`. Less robust than `loky`.
    - "threading" is a very low-overhead backend but it suffers
      from the Python Global Interpreter Lock if the called function
      relies a lot on Python objects. "threading" is mostly useful
      when the execution bottleneck is a compiled extension that
      explicitly releases the GIL (for instance a Cython loop wrapped
      in a "with nogil" block or an expensive call to a library such
      as NumPy).
    - finally, you can register backends by calling
      register_parallel_backend. This will allow you to implement
      a backend of your liking.

    It is not recommended to hard-code the backend name in a call to
    Parallel in a library. Instead it is recommended to set soft hints
    (prefer) or hard constraints (require) so as to make it possible
    for library users to change the backend from the outside using the
    parallel_backend context manager.
prefer: str in {'processes', 'threads'} or None, default: None
    Soft hint to choose the default backend if no specific backend
    was selected with the parallel_backend context manager. The
    default process-based backend is 'loky' and the default
    thread-based backend is 'threading'. Ignored if the ``backend``
    parameter is specified.
require: 'sharedmem' or None, default None
    Hard constraint to select the backend. If set to 'sharedmem',
    the selected backend will be single-host and thread-based even
    if the user asked for a non-thread based backend with
    parallel_backend.
verbose: int, optional
    The verbosity level: if non zero, progress messages are
    printed. Above 50, the output is sent to stdout.
    The frequency of the messages increases with the verbosity level.
    If it more than 10, all iterations are reported.
timeout: float, optional
    Timeout limit for each task to complete.  If any task takes longer
    a TimeOutError will be raised. Only applied when n_jobs != 1
pre_dispatch: {'all', integer, or expression, as in '3*n_jobs'}
    The number of batches (of tasks) to be pre-dispatched.
    Default is '2*n_jobs'. When batch_size="auto" this is reasonable
    default and the workers should never starve.
batch_size: int or 'auto', default: 'auto'
    The number of atomic tasks to dispatch at once to each
    worker. When individual evaluations are very fast, dispatching
    calls to workers can be slower than sequential computation because
    of the overhead. Batching fast computations together can mitigate
    this.
    The ``'auto'`` strategy keeps track of the time it takes for a batch
    to complete, and dynamically adjusts the batch size to keep the time
    on the order of half a second, using a heuristic. The initial batch
    size is 1.
    ``batch_size="auto"`` with ``backend="threading"`` will dispatch
    batches of a single task at a time as the threading backend has
    very little overhead and using larger batch size has not proved to
    bring any gain in that case.
temp_folder: str, optional
    Folder to be used by the pool for memmapping large arrays
    for sharing memory with worker processes. If None, this will try in
    order:

    - a folder pointed by the JOBLIB_TEMP_FOLDER environment
      variable,
    - /dev/shm if the folder exists and is writable: this is a
      RAM disk filesystem available by default on modern Linux
      distributions,
    - the default system temporary folder that can be
      overridden with TMP, TMPDIR or TEMP environment
      variables, typically /tmp under Unix operating systems.

    Only active when backend="loky" or "multiprocessing".
max_nbytes int, str, or None, optional, 1M by default
    Threshold on the size of arrays passed to the workers that
    triggers automated memory mapping in temp_folder. Can be an int
    in Bytes, or a human-readable string, e.g., '1M' for 1 megabyte.
    Use None to disable memmapping of large arrays.
    Only active when backend="loky" or "multiprocessing".
mmap_mode: {None, 'r+', 'r', 'w+', 'c'}
    Memmapping mode for numpy arrays passed to workers.
    See 'max_nbytes' parameter documentation for more details.

Notes
-----

This object uses workers to compute in parallel the application of a
function to many different arguments. The main functionality it brings
in addition to using the raw multiprocessing or concurrent.futures API
are (see examples for details):

* More readable code, in particular since it avoids
  constructing list of arguments.

* Easier debugging:
    - informative tracebacks even when the error happens on
      the client side
    - using 'n_jobs=1' enables to turn off parallel computing
      for debugging without changing the codepath
    - early capture of pickling errors

* An optional progress meter.

* Interruption of multiprocesses jobs with 'Ctrl-C'

* Flexible pickling control for the communication to and from
  the worker processes.

* Ability to use shared memory efficiently with worker
  processes for large numpy-based datastructures.

Examples
--------

A simple example:

>>> from math import sqrt
>>> from joblib import Parallel, delayed
>>> Parallel(n_jobs=1)(delayed(sqrt)(i**2) for i in range(10))
[0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0]

Reshaping the output when the function has several return
values:

>>> from math import modf
>>> from joblib import Parallel, delayed
>>> r = Parallel(n_jobs=1)(delayed(modf)(i/2.) for i in range(10))
>>> res, i = zip( *r)
>>> res
(0.0, 0.5, 0.0, 0.5, 0.0, 0.5, 0.0, 0.5, 0.0, 0.5)
>>> i
(0.0, 0.0, 1.0, 1.0, 2.0, 2.0, 3.0, 3.0, 4.0, 4.0)

The progress meter: the higher the value of `verbose`, the more
messages:

>>> from time import sleep
>>> from joblib import Parallel, delayed
>>> r = Parallel(n_jobs=2, verbose=10)(delayed(sleep)(.2) for _ in range(10)) #doctest: +SKIP
[Parallel(n_jobs=2)]: Done   1 tasks      | elapsed:    0.6s
[Parallel(n_jobs=2)]: Done   4 tasks      | elapsed:    0.8s
[Parallel(n_jobs=2)]: Done  10 out of  10 | elapsed:    1.4s finished

Traceback example, note how the line of the error is indicated
as well as the values of the parameter passed to the function that
triggered the exception, even though the traceback happens in the
child process:

>>> from heapq import nlargest
>>> from joblib import Parallel, delayed
>>> Parallel(n_jobs=2)(delayed(nlargest)(2, n) for n in (range(4), 'abcde', 3)) #doctest: +SKIP
#...
---------------------------------------------------------------------------
Sub-process traceback:
---------------------------------------------------------------------------
TypeError                                          Mon Nov 12 11:37:46 2012
PID: 12934                                    Python 2.7.3: /usr/bin/python
...........................................................................
/usr/lib/python2.7/heapq.pyc in nlargest(n=2, iterable=3, key=None)
    419         if n >= size:
    420             return sorted(iterable, key=key, reverse=True)[:n]
    421
    422     # When key is none, use simpler decoration
    423     if key is None:
--> 424         it = izip(iterable, count(0,-1))                    # decorate
    425         result = _nlargest(n, it)
    426         return map(itemgetter(0), result)                   # undecorate
    427
    428     # General case, slowest method
 TypeError: izip argument #1 must support iteration
___________________________________________________________________________


Using pre_dispatch in a producer/consumer situation, where the
data is generated on the fly. Note how the producer is first
called 3 times before the parallel loop is initiated, and then
called to generate new data on the fly:

>>> from math import sqrt
>>> from joblib import Parallel, delayed
>>> def producer():
...     for i in range(6):
...         print('Produced %s' % i)
...         yield i
>>> out = Parallel(n_jobs=2, verbose=100, pre_dispatch='1.5*n_jobs')(
...                delayed(sqrt)(i) for i in producer()) #doctest: +SKIP
Produced 0
Produced 1
Produced 2
[Parallel(n_jobs=2)]: Done 1 jobs     | elapsed:  0.0s
Produced 3
[Parallel(n_jobs=2)]: Done 2 jobs     | elapsed:  0.0s
Produced 4
[Parallel(n_jobs=2)]: Done 3 jobs     | elapsed:  0.0s
Produced 5
[Parallel(n_jobs=2)]: Done 4 jobs     | elapsed:  0.0s
[Parallel(n_jobs=2)]: Done 6 out of 6 | elapsed:  0.0s remaining: 0.0s
[Parallel(n_jobs=2)]: Done 6 out of 6 | elapsed:  0.0s finished
*)

val debug : msg:Py.Object.t -> t -> Py.Object.t
(**
None
*)

val dispatch_next : t -> Py.Object.t
(**
Dispatch more data for parallel processing

This method is meant to be called concurrently by the multiprocessing
callback. We rely on the thread-safety of dispatch_one_batch to protect
against concurrent consumption of the unprotected iterator.
*)

val dispatch_one_batch : iterator:Py.Object.t -> t -> Py.Object.t
(**
Prefetch the tasks for the next batch and dispatch them.

The effective size of the batch is computed here.
If there are no more jobs to dispatch, return False, else return True.

The iterator consumption and dispatching is protected by the same
lock so calling this function should be thread safe.
*)

val format : ?indent:Py.Object.t -> obj:Py.Object.t -> t -> Py.Object.t
(**
Return the formatted representation of the object.
*)

val print_progress : t -> Py.Object.t
(**
Display the process of the parallel execution only a fraction
of time, controlled by self.verbose.
*)

val retrieve : t -> Py.Object.t
(**
None
*)

val warn : msg:Py.Object.t -> t -> Py.Object.t
(**
None
*)


(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

val cartesian : ?out:Py.Object.t -> arrays:Py.Object.t -> unit -> Ndarray.t
(**
Generate a cartesian product of input arrays.

Parameters
----------
arrays : list of array-like
    1-D arrays to form the cartesian product of.
out : ndarray
    Array to place the cartesian product in.

Returns
-------
out : ndarray
    2-D array of shape (M, len(arrays)) containing cartesian products
    formed of input arrays.

Examples
--------
>>> cartesian(([1, 2, 3], [4, 5], [6, 7]))
array([[1, 4, 6],
       [1, 4, 7],
       [1, 5, 6],
       [1, 5, 7],
       [2, 4, 6],
       [2, 4, 7],
       [2, 5, 6],
       [2, 5, 7],
       [3, 4, 6],
       [3, 4, 7],
       [3, 5, 6],
       [3, 5, 7]])
*)

val check_array : ?accept_sparse:[`String of string | `Bool of bool | `StringList of string list] -> ?accept_large_sparse:bool -> ?dtype:[`String of string | `Dtype of Py.Object.t | `TypeList of Py.Object.t | `None] -> ?order:[`F | `C | `None] -> ?copy:bool -> ?force_all_finite:[`Bool of bool | `Allow_nan] -> ?ensure_2d:bool -> ?allow_nd:bool -> ?ensure_min_samples:int -> ?ensure_min_features:int -> ?warn_on_dtype:[`Bool of bool | `None] -> ?estimator:[`String of string | `Estimator of Py.Object.t] -> array:Py.Object.t -> unit -> Py.Object.t
(**
Input validation on an array, list, sparse matrix or similar.

By default, the input is checked to be a non-empty 2D array containing
only finite values. If the dtype of the array is object, attempt
converting to float, raising on failure.

Parameters
----------
array : object
    Input object to check / convert.

accept_sparse : string, boolean or list/tuple of strings (default=False)
    String[s] representing allowed sparse matrix formats, such as 'csc',
    'csr', etc. If the input is sparse but not in the allowed format,
    it will be converted to the first listed format. True allows the input
    to be any format. False means that a sparse matrix input will
    raise an error.

accept_large_sparse : bool (default=True)
    If a CSR, CSC, COO or BSR sparse matrix is supplied and accepted by
    accept_sparse, accept_large_sparse=False will cause it to be accepted
    only if its indices are stored with a 32-bit dtype.

    .. versionadded:: 0.20

dtype : string, type, list of types or None (default="numeric")
    Data type of result. If None, the dtype of the input is preserved.
    If "numeric", dtype is preserved unless array.dtype is object.
    If dtype is a list of types, conversion on the first type is only
    performed if the dtype of the input is not in the list.

order : 'F', 'C' or None (default=None)
    Whether an array will be forced to be fortran or c-style.
    When order is None (default), then if copy=False, nothing is ensured
    about the memory layout of the output array; otherwise (copy=True)
    the memory layout of the returned array is kept as close as possible
    to the original array.

copy : boolean (default=False)
    Whether a forced copy will be triggered. If copy=False, a copy might
    be triggered by a conversion.

force_all_finite : boolean or 'allow-nan', (default=True)
    Whether to raise an error on np.inf and np.nan in array. The
    possibilities are:

    - True: Force all values of array to be finite.
    - False: accept both np.inf and np.nan in array.
    - 'allow-nan': accept only np.nan values in array. Values cannot
      be infinite.

    For object dtyped data, only np.nan is checked and not np.inf.

    .. versionadded:: 0.20
       ``force_all_finite`` accepts the string ``'allow-nan'``.

ensure_2d : boolean (default=True)
    Whether to raise a value error if array is not 2D.

allow_nd : boolean (default=False)
    Whether to allow array.ndim > 2.

ensure_min_samples : int (default=1)
    Make sure that the array has a minimum number of samples in its first
    axis (rows for a 2D array). Setting to 0 disables this check.

ensure_min_features : int (default=1)
    Make sure that the 2D array has some minimum number of features
    (columns). The default value of 1 rejects empty datasets.
    This check is only enforced when the input data has effectively 2
    dimensions or is originally 1D and ``ensure_2d`` is True. Setting to 0
    disables this check.

warn_on_dtype : boolean or None, optional (default=None)
    Raise DataConversionWarning if the dtype of the input data structure
    does not match the requested dtype, causing a memory copy.

    .. deprecated:: 0.21
        ``warn_on_dtype`` is deprecated in version 0.21 and will be
        removed in 0.23.

estimator : str or estimator instance (default=None)
    If passed, include the name of the estimator in warning messages.

Returns
-------
array_converted : object
    The converted and validated array.
*)

val check_is_fitted : ?attributes:[`String of string | `ArrayLike of Py.Object.t | `StringList of string list] -> ?msg:string -> ?all_or_any:[`Callable of Py.Object.t | `PyObject of Py.Object.t] -> estimator:Py.Object.t -> unit -> Py.Object.t
(**
Perform is_fitted validation for estimator.

Checks if the estimator is fitted by verifying the presence of
fitted attributes (ending with a trailing underscore) and otherwise
raises a NotFittedError with the given message.

This utility is meant to be used internally by estimators themselves,
typically in their own predict / transform methods.

Parameters
----------
estimator : estimator instance.
    estimator instance for which the check is performed.

attributes : str, list or tuple of str, default=None
    Attribute name(s) given as string or a list/tuple of strings
    Eg.: ``["coef_", "estimator_", ...], "coef_"``

    If `None`, `estimator` is considered fitted if there exist an
    attribute that ends with a underscore and does not start with double
    underscore.

msg : string
    The default error message is, "This %(name)s instance is not fitted
    yet. Call 'fit' with appropriate arguments before using this
    estimator."

    For custom messages if "%(name)s" is present in the message string,
    it is substituted for the estimator name.

    Eg. : "Estimator, %(name)s, must be fitted before sparsifying".

all_or_any : callable, {all, any}, default all
    Specify whether all or any of the given attributes must exist.

Returns
-------
None

Raises
------
NotFittedError
    If the attributes are not found.
*)

val delayed : ?check_pickle:Py.Object.t -> function_:Py.Object.t -> unit -> Py.Object.t
(**
Decorator used to capture the arguments of a function.
*)

module Deprecated : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?extra:string -> unit -> t
(**
Decorator to mark a function or class as deprecated.

Issue a warning when the function is called/the class is instantiated and
adds a warning to the docstring.

The optional extra argument will be appended to the deprecation message
and the docstring. Note: to use this with the default value for extra, put
in an empty of parentheses:

>>> from sklearn.utils import deprecated
>>> deprecated()
<sklearn.utils.deprecation.deprecated object at ...>

>>> @deprecated()
... def some_function(): pass

Parameters
----------
extra : string
      to be added to the deprecation messages
*)


(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

val mquantiles : ?prob:Py.Object.t -> ?alphap:Py.Object.t -> ?betap:Py.Object.t -> ?axis:Py.Object.t -> ?limit:Py.Object.t -> a:Ndarray.t -> unit -> Py.Object.t
(**
Computes empirical quantiles for a data array.

Samples quantile are defined by ``Q(p) = (1-gamma)*x[j] + gamma*x[j+1]``,
where ``x[j]`` is the j-th order statistic, and gamma is a function of
``j = floor(n*p + m)``, ``m = alphap + p*(1 - alphap - betap)`` and
``g = n*p + m - j``.

Reinterpreting the above equations to compare to **R** lead to the
equation: ``p(k) = (k - alphap)/(n + 1 - alphap - betap)``

Typical values of (alphap,betap) are:
    - (0,1)    : ``p(k) = k/n`` : linear interpolation of cdf
      ( **R** type 4)
    - (.5,.5)  : ``p(k) = (k - 1/2.)/n`` : piecewise linear function
      ( **R** type 5)
    - (0,0)    : ``p(k) = k/(n+1)`` :
      ( **R** type 6)
    - (1,1)    : ``p(k) = (k-1)/(n-1)``: p(k) = mode[F(x[k])].
      ( **R** type 7, **R** default)
    - (1/3,1/3): ``p(k) = (k-1/3)/(n+1/3)``: Then p(k) ~ median[F(x[k])].
      The resulting quantile estimates are approximately median-unbiased
      regardless of the distribution of x.
      ( **R** type 8)
    - (3/8,3/8): ``p(k) = (k-3/8)/(n+1/4)``: Blom.
      The resulting quantile estimates are approximately unbiased
      if x is normally distributed
      ( **R** type 9)
    - (.4,.4)  : approximately quantile unbiased (Cunnane)
    - (.35,.35): APL, used with PWM

Parameters
----------
a : array_like
    Input data, as a sequence or array of dimension at most 2.
prob : array_like, optional
    List of quantiles to compute.
alphap : float, optional
    Plotting positions parameter, default is 0.4.
betap : float, optional
    Plotting positions parameter, default is 0.4.
axis : int, optional
    Axis along which to perform the trimming.
    If None (default), the input array is first flattened.
limit : tuple, optional
    Tuple of (lower, upper) values.
    Values of `a` outside this open interval are ignored.

Returns
-------
mquantiles : MaskedArray
    An array containing the calculated quantiles.

Notes
-----
This formulation is very similar to **R** except the calculation of
``m`` from ``alphap`` and ``betap``, where in **R** ``m`` is defined
with each type.

References
----------
.. [1] *R* statistical software: https://www.r-project.org/
.. [2] *R* ``quantile`` function:
        http://stat.ethz.ch/R-manual/R-devel/library/stats/html/quantile.html

Examples
--------
>>> from scipy.stats.mstats import mquantiles
>>> a = np.array([6., 47., 49., 15., 42., 41., 7., 39., 43., 40., 36.])
>>> mquantiles(a)
array([ 19.2,  40. ,  42.8])

Using a 2D array, specifying axis and limit.

>>> data = np.array([[   6.,    7.,    1.],
...                  [  47.,   15.,    2.],
...                  [  49.,   36.,    3.],
...                  [  15.,   39.,    4.],
...                  [  42.,   40., -999.],
...                  [  41.,   41., -999.],
...                  [   7., -999., -999.],
...                  [  39., -999., -999.],
...                  [  43., -999., -999.],
...                  [  40., -999., -999.],
...                  [  36., -999., -999.]])
>>> print(mquantiles(data, axis=0, limit=(0, 50)))
[[19.2  14.6   1.45]
 [40.   37.5   2.5 ]
 [42.8  40.05  3.55]]

>>> data[:, 2] = -999.
>>> print(mquantiles(data, axis=0, limit=(0, 50)))
[[19.200000000000003 14.6 --]
 [40.0 37.5 --]
 [42.800000000000004 40.05 --]]
*)

val partial_dependence : ?grid:Ndarray.t -> ?x:Ndarray.t -> ?percentiles:Py.Object.t -> ?grid_resolution:int -> gbrt:Py.Object.t -> target_variables:[`Ndarray of Ndarray.t | `PyObject of Py.Object.t] -> unit -> (Ndarray.t * Py.Object.t)
(**
DEPRECATED: The function ensemble.partial_dependence has been deprecated in favour of inspection.partial_dependence in 0.21 and will be removed in 0.23.

Partial dependence of ``target_variables``.

    Partial dependence plots show the dependence between the joint values
    of the ``target_variables`` and the function represented
    by the ``gbrt``.

    Read more in the :ref:`User Guide <partial_dependence>`.

    .. deprecated:: 0.21
       This function was deprecated in version 0.21 in favor of
       :func:`sklearn.inspection.partial_dependence` and will be
       removed in 0.23.

    Parameters
    ----------
    gbrt : BaseGradientBoosting
        A fitted gradient boosting model.

    target_variables : array-like, dtype=int
        The target features for which the partial dependency should be
        computed (size should be smaller than 3 for visual renderings).

    grid : array-like of shape (n_points, n_target_variables)
        The grid of ``target_variables`` values for which the
        partial dependency should be evaluated (either ``grid`` or ``X``
        must be specified).

    X : array-like of shape (n_samples, n_features)
        The data on which ``gbrt`` was trained. It is used to generate
        a ``grid`` for the ``target_variables``. The ``grid`` comprises
        ``grid_resolution`` equally spaced points between the two
        ``percentiles``.

    percentiles : (low, high), default=(0.05, 0.95)
        The lower and upper percentile used create the extreme values
        for the ``grid``. Only if ``X`` is not None.

    grid_resolution : int, default=100
        The number of equally spaced points on the ``grid``.

    Returns
    -------
    pdp : array, shape=(n_classes, n_points)
        The partial dependence function evaluated on the ``grid``.
        For regression and binary classification ``n_classes==1``.

    axes : seq of ndarray or None
        The axes with which the grid has been created or None if
        the grid has been given.

    Examples
    --------
    >>> samples = [[0, 0, 2], [1, 0, 0]]
    >>> labels = [0, 1]
    >>> from sklearn.ensemble import GradientBoostingClassifier
    >>> gb = GradientBoostingClassifier(random_state=0).fit(samples, labels)
    >>> kwargs = dict(X=samples, percentiles=(0, 1), grid_resolution=2)
    >>> partial_dependence(gb, [0], **kwargs) # doctest: +SKIP
    (array([[-4.52...,  4.52...]]), [array([ 0.,  1.])])
    
*)

val plot_partial_dependence : ?feature_names:Py.Object.t -> ?label:Py.Object.t -> ?n_cols:int -> ?grid_resolution:int -> ?percentiles:Py.Object.t -> ?n_jobs:[`Int of int | `None] -> ?verbose:int -> ?ax:Py.Object.t -> ?line_kw:Py.Object.t -> ?contour_kw:Py.Object.t -> ?fig_kw:(string * Py.Object.t) list -> gbrt:Py.Object.t -> x:Ndarray.t -> features:[`StringList of string list | `PyObject of Py.Object.t] -> unit -> (Py.Object.t * Py.Object.t)
(**
DEPRECATED: The function ensemble.plot_partial_dependence has been deprecated in favour of sklearn.inspection.plot_partial_dependence in  0.21 and will be removed in 0.23.

Partial dependence plots for ``features``.

    The ``len(features)`` plots are arranged in a grid with ``n_cols``
    columns. Two-way partial dependence plots are plotted as contour
    plots.

    Read more in the :ref:`User Guide <partial_dependence>`.

    .. deprecated:: 0.21
       This function was deprecated in version 0.21 in favor of
       :func:`sklearn.inspection.plot_partial_dependence` and will be
       removed in 0.23.

    Parameters
    ----------
    gbrt : BaseGradientBoosting
        A fitted gradient boosting model.

    X : array-like of shape (n_samples, n_features)
        The data on which ``gbrt`` was trained.

    features : seq of ints, strings, or tuples of ints or strings
        If seq[i] is an int or a tuple with one int value, a one-way
        PDP is created; if seq[i] is a tuple of two ints, a two-way
        PDP is created.
        If feature_names is specified and seq[i] is an int, seq[i]
        must be < len(feature_names).
        If seq[i] is a string, feature_names must be specified, and
        seq[i] must be in feature_names.

    feature_names : seq of str
        Name of each feature; feature_names[i] holds
        the name of the feature with index i.

    label : object
        The class label for which the PDPs should be computed.
        Only if gbrt is a multi-class model. Must be in ``gbrt.classes_``.

    n_cols : int
        The number of columns in the grid plot (default: 3).

    grid_resolution : int, default=100
        The number of equally spaced points on the axes.

    percentiles : (low, high), default=(0.05, 0.95)
        The lower and upper percentile used to create the extreme values
        for the PDP axes.

    n_jobs : int or None, optional (default=None)
        ``None`` means 1 unless in a :obj:`joblib.parallel_backend` context.
        ``-1`` means using all processors. See :term:`Glossary <n_jobs>`
        for more details.

    verbose : int
        Verbose output during PD computations. Defaults to 0.

    ax : Matplotlib axis object, default None
        An axis object onto which the plots will be drawn.

    line_kw : dict
        Dict with keywords passed to the ``matplotlib.pyplot.plot`` call.
        For one-way partial dependence plots.

    contour_kw : dict
        Dict with keywords passed to the ``matplotlib.pyplot.plot`` call.
        For two-way partial dependence plots.

    ``**fig_kw`` : dict
        Dict with keywords passed to the figure() call.
        Note that all keywords not recognized above will be automatically
        included here.

    Returns
    -------
    fig : figure
        The Matplotlib Figure object.

    axs : seq of Axis objects
        A seq of Axis objects, one for each subplot.

    Examples
    --------
    >>> from sklearn.datasets import make_friedman1
    >>> from sklearn.ensemble import GradientBoostingRegressor
    >>> X, y = make_friedman1()
    >>> clf = GradientBoostingRegressor(n_estimators=10).fit(X, y)
    >>> fig, axs = plot_partial_dependence(clf, X, [0, (0, 1)]) #doctest: +SKIP
    ...
    
*)


end

