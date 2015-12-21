# CS502-Summary-Chapter 1

[TOC]


## What is Computer Science?

Computer Science is the science of 

* algorithm processing
* representation
* storage and 
* transmission

of information.

## What is Algorithm?
An algorithm is a well defined computational procedure that converts input into output.
``Input -> Algorithm -> Output``
**Example**: a set of n real numbers

## Why we need to study Algorithms?
Algorithm address issues related to: feasibility, effeciency & performance, and scalability.

* Study of algorithm enables us to determine, if a computer program is feasible, or infeasible.
* Effecient algorithm lead to an effecient computer program, & effecient use of hardware resource.
* Algorithm helps us to understand issues related to scalability.
* Analysis of algorithm provides a language for talking about program behavior.

However, we should understand that computer program effeciency is only certain facet of overall computer resource usage.

### Examples:

#### Greatest Common Divisor (gcd) & Euclidean Algorithm
```
gcd(2,4) = 2
gcd(10,5) = 10
gcd(27,112) = 1
gcd(56432,92431)=?
gcd(256,384)=128
```
**Algorithm:**

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/f92ff425-d769-4824-b349-bc452e8cb139.png)

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/0c3e4c17-fa5f-4fc6-85e5-c58aa4b1f5c3.png)

#### Method of Repeated Squaring

$2*2=2^2=4$ –> **1 multiplication**
$2*2*2=2^3=8$ –> **2 multiplications**
$2*2*2*2*2*2=2^6$ –> **1 multiplications**

=> With this behavior, $2^8=256$ (7 multiplications)

Instead of 7 multiplications, we can do it shorter with only 3 multiplications:

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/eef2a30f-2de3-420f-91cc-f554d02ce9bd.png)

So for $2^{32}$ it usually takes 31 multiplications now only needs 5 multiplications: $2^2, 2^4, 2^8, 2^{16}, 2^{32}$.

## MATHS Notation:

* $\mathbb{P}=\{1,2,3,...\}$ : Set of positive numbers
* $\mathbb{N}=\{0,1,2,3,...\}$ : Set of natural numbers
* $\mathbb{Z}=\{...,-2,-1,0,1,2,...\}$ : Set of positive & negative and 0.
* $\mathbb{R}=(-\infty,+\infty)$ : Set of real numbers
* $\mathbb{R^+}=(0,+\infty)$ : Set of positive real numbers
* $\mathbb{R}^+_{0}=[0,+\infty)$ : Set of real numbers ≥ 0
* $\mathbb{Q}=\{\frac{m}{n}|m,n \in \mathbb{Z}; n \ne 0 \}$ : Set of rational numbers
* $\mathbb{C}_{0}=\{a+ib | a,b \in \mathbb{R}, i=\sqrt{-1} \}$ : Set of complex numbers

## Some important Facts
### Logarithms
1. $logxy = logx + logy$
2. $log_ab*log_ba = 1$
3. $log_ax^y = ylog_ax$
4. $ a^{log_bn} = n^{log_ba}$

### GP

1. $S = a + ar + ar^2 + ar^{n-1}$
    
    $=\frac{a(1-r^n)}{1-r}; r \ne 1$
    $S = na; r=1$
2. $S = a + ar + ar^2 + ...$
    
    $ = \frac{a}{1-r}; |r| < 1 $

### AP
1. $S = 1 + 2 + 3 + ... + n = \frac{n(n+1)}{2}$
2. $ S = a + (a+d) + (a+2d) + ... + [a+(n-1)d] $
    
    $ =[a + (a+(n-1)d)]\frac{n}{2} $

### Calculus
1. $ \frac{d}{dx}x^n = nx^{n-1} $
2. $ \frac{d}{dx}a^x = a^xlna $

### MATHS Interlude
1. $S = 1 + x + x^2 + ... = \frac{1}{1-x}; |x| < 1 $    
    
    $S = \sum^\infty_{i=0}x^i=\frac{1}{1-x}; |x| < 1 $
2. $\frac{dS}{dx} = 1+2x+3x^2+4x^3 + ... = \frac{1}{(1-x)^2} $
    
    $\frac{1}{(1-x)^2} = 1+2x + 3x^2 + 4x^3... $
    $ \rightarrow \frac{x}{(1-x)^2} = x + 2x^2 + 3x^3 + 4x^4 + ... = \sum^\infty_{i=1}ix^i $ 


=> $ \sum^\infty_{i=1}ix^i = \frac{x}{(1-x)^2}; |x| < 1 $

### Examples 

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/9a93fd32-0413-44bd-82b8-7e5aa5ebfc79.png)
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/88fe3cfa-5148-4b6b-9188-18d289ff8353.png)

## Asymptotic Notation
> Asymptotic Notation are languages that allow us to analyze an algorithm's running time by identifying its behavior as the input size for the algorithm increases. This is also known as an algorithm's growth rate.

Computational Steps <br/>(fastest to slowest) | Example (N=100)
---|---
Constant – 1 | 1
Logarithmic - $Log(n)$ | 6.64
N-Linear | 100
Log-Linear – $ N*logn $ | 664
Quadratic - $N^2$ | 10,000
Cubic - $N^3$ | 100,000
Exponential – $2^n$ | 127000000000....
Factorial - $N!$ | 3000000000000000000...

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/4b2b2452-9d2f-4dbb-8bb3-7b827c43b960.png)
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/6bda52c0-642a-4b97-b534-2144831d76a3.png)

Let $$L = \lim_{n\rightarrow\infty} \frac {f(n)}{g(n)} $$

Condition|Notation|Name
---|---|---
$0≤L<\infty$|$\mathcal{0}$|Big O
$0<L≤\infty$|$\Omega$|Big Omega
$0<L<\infty$|$\Theta$|Big Theta
$L=0$|$o$|Small O
$L=+\infty$|$\omega$|Small Omega

### Problems
Indicate whether 

* $f = \mathcal{0}(g)$; or
* $f = \Omega(g)$; or
* $f = \Theta(g)$; or
* $f = o(g)$; or
* $f = \omega(g)$

#### Examples
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/ea22c06d-d4ed-4b6a-95d4-c914e35ba1d2.png)
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/91164729-e5dd-4c3d-8696-1dfc7c412b87.png)

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/66695a48-1343-4ecd-a00d-adba6ecf5d2f.png)

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/97467d97-f16d-45fc-82a7-58bc2d29f911.png)

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/314dd2d2-6cbd-4a6f-8337-b8539180a914.png)

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/17858ac7-7ce3-47b3-85fd-d40102f2e999.png)

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/8b7aab86-2acc-48b6-a245-5452123dde93.png)

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/e836401d-950d-4429-b483-9e11654c72dd.png)

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/e4edc1e9-c414-4d4e-9291-4f959d301b0a.png)

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/f297a802-279c-4051-ad27-d572467781f1.png)

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/12ec532f-7e17-4e7f-af15-0739455fc250.png)

## Assignments
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/3ece3170-d181-4f9e-a355-84da2b7edabe.png)
