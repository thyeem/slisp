module SLispSpec where

import SLisp
import Test.Hspec

spec :: Spec
spec = do
  describe "sLISP REPL show" $ do
    mapM_ (uncurry (test t)) in'out

t :: String -> String
t stream = do
  case re stream (init'env 0) of
    Left err -> err
    Right (_, e) -> show' e

test :: (String -> String) -> String -> String -> SpecWith (Arg Expectation)
test f i o = it i $ do
  f i `shouldBe` o

in'out :: [(String, String)]
in'out =
  [ ("nil", "nil")
  , ("'nil", "nil")
  , ("`nil", "nil")
  , ("()", "nil")
  , ("'()", "nil")
  , ("`()", "nil")
  , ("(eval (nth 2 '(1 2 (+ (* 34 43) 22) 4 5)))", "1484")
  , ("(cons '(2 . 3) ())", "((2 . 3))")
  , ("(= 1 1 1)", "t")
  , ("(= 1 1 2)", "nil")
  , ("(< 1 2 3)", "t")
  , ("(< 1 3 2)", "nil")
  , ("(list 1 2 3)", "(1 2 3)")
  , ("(cons 1 2)", "(1 . 2)")
  , ("(car (cons 1 2))", "1")
  , ("(cdr (cons 1 2))", "2")
  , ("(first '(1 2))", "1")
  , ("(second '(1 2))", "2")
  , ("(defvar covid-19 2020)", "covid-19")
  , ("(setq covid-19 2020)", "2020")
  , ("(let () (defparameter x 1) x)", "1")
  , ("(let () (setq y 'covid-19) y)", "covid-19")
  , ("(let ((x 1) (y 2) (z 3)) (+ x y z))", "6")
  , ("(let* ((x 1) (y (+ x 1)) (z (+ y 1))) (+ x y z))", "6")
  , ("`(1 ,(+ 1 1) (- 4 1) 4)", "(1 2 (- 4 1) 4)")
  , ("(let ((x '(123)) (z '(7 8 9))) `(,@x 45 6 ,@z))", "(123 45 6 7 8 9)")
  , ("(let ((x 3)) `(1 ,x \"foo\"))", "(1 3 \"foo\")")
  , ("`(,@`(,@`(1 2 3) 112))", "(1 2 3 112)")
  , ("`(,@'(+ 1 2))", "(+ 1 2)")
  , ("``(,@,`(1 2 3))", "`(,@(1 2 3))")
  , ("(eval `(list ,@'(9 5) 1 2 3))", "(9 5 1 2 3)")
  , ("`(1 2 @,'(a b c))", "(1 2 @ (a b c))")
  , ("(let ((x '(1 2 3))) `(,@x))", "(1 2 3)")
  , ("(let ((x '(1 2 3))) ``(,@,x))", "`(,@(1 2 3))")
  , ("``(a ,,(+ 1 2) ,(+ 3 4))", "`(a ,3 ,(+ 3 4))")
  , ("``,,'(1 2)", "`,(1 2)")
  , ("`(,@`(1 2 3))", "(1 2 3)")
  , ("``(bq x ,x ,@x ,bq)", "`(bq x ,x ,@x ,bq)")
  , ("`(,@'123)", "123")
  , ("(let ((y 123)) `(,@y))", "123")
  , ("``(,@,@'(1 2 3))", "`(,@1 ,@2 ,@3)")
  , ("(let ((x '(1 2 3))) ``(,,@x))", "`(,1 ,2 ,3)")
  , ("``('a 'b ,@,@'(1 'c) () nil '())", "`('a 'b ,@1 ,@'c nil nil 'nil)")
  ,
    ( "(let ((x '(a b c))) `(x ,x ,@x foo ,(cadr x) bar ,(cdr x) baz ,@(cdr x)))"
    , "(x (a b c) a b c foo b bar (b c) baz b c)"
    )
  ,
    ( "(let ((c (list 22 33))) `(foobar a b ,c ,'(e f g) d ,@'(e f g) (h i j) ,@c))"
    , "(foobar a b (22 33) (e f g) d e f g (h i j) 22 33)"
    )
  , ("(append)", "nil")
  , ("(append 'a)", "a")
  , ("(append '(a b c) '(d e f) '() '(g))", "(a b c d e f g)")
  , ("(append '(a b c) 'd)", "(a b c . d)")
  , ("(let ((lst '(a b c))) (append lst '(d)))", "(a b c d)")
  , ("(list)", "nil")
  , ("(when t)", "nil")
  , ("(when nil)", "nil")
  , ("(unless t)", "nil")
  , ("(unless nil)", "nil")
  , ("(progn (setq lst '(1 2 3 4)) (butlast lst))", "(1 2 3)")
  , ("(if nil 't 'very-false)", "very-false")
  , ("(let ((x 3)) (when (oddp x) 'odd))", "odd")
  , ("(let ((x 3)) (unless (oddp x) 'odd))", "nil")
  , ("(let ((x 3)) (if (oddp (+ x x)) 'odd 'even))", "even")
  , ("(funcall '+ 2/3 4/5 6/7 8/9 (* 12/23 123/321))", "2645512/775215")
  , ("(progn (defun maria (x y) (/ x y)) (maria 1111 2222))", "1/2")
  ,
    ( "(progn (setq sofia (lambda (x y) (* x y))) (apply sofia 14 11 nil))"
    , "154"
    )
  , ("((lambda (x y) (abs (/ (* #c(3 -3) x) y))) 2 #c(2 -2))", "3.0")
  ]
