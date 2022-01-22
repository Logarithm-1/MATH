//
//  File.swift
//  File
//
//  Created by Logan Richards on 10/6/21.
//

import Foundation

extension MATH {
    
    ///[link](https://en.wikipedia.org/wiki/List_of_mathematical_constants)
    public struct Constants {
        
        //MARK: - Antiquity
        //MARK: Pi (1900 to 1600 BCE)
        /// The number `π` (small pi) is a mathematical constant.
        /// It is defined in Euclidean Geometry as the ratio of a circle's circumference to its diameter.
        ///
        /// The number appears in many formulas in all areas of mathematics and physics.
        /// `π` is an irratinal number, as such cannout be expressed as a common fraction. Its decimal digits appear to be randomly distributed, and are conjectured to satisfy a specifc kind of statistical randomness.
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Pi)
        public static let pi: Double = 3.1415_9265_3589_7932_3846
        
        /// The number `π` (small pi) is a mathematical constant.
        /// It is defined in Euclidean Geometry as the ratio of a circle's circumference to its diameter.
        ///
        /// The number appears in many formulas in all areas of mathematics and physics.
        /// `π` is an irratinal number, as such cannout be expressed as a common fraction. Its decimal digits appear to be randomly distributed, and are conjectured to satisfy a specifc kind of statistical randomness.
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Pi)
        public static let π: Double = pi
        
        //MARK: The Golden Ratio (~300 BCE)
        /// The Golden Ratio commonly represented by `𝝋` (small phi), is an irrational number that is a solution to the positive root of the quadratic equation `x^2 - x - 1 = 0`.
        ///
        /// It's application endless, showing up in Nature, Art, Music, Architecture, etc.
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Golden_ratio)
        public static let goldenRatio: Double = 1.6180_3398_8749_8948_4820
        
        /// The Golden Ratio commonly represented by `𝝋` (small phi), is an irrational number that is a solution to the positive root of the quadratic equation `x^2 - x - 1 = 0`.
        ///
        /// It's application endless, showing up in Nature, Art, Music, Architecture, etc.
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Golden_ratio)
        public static let phi: Double = goldenRatio
        
        /// The Golden Ratio commonly represented by `𝝋` (small phi), is an irrational number that is a solution to the positive root of the quadratic equation `x^2 - x - 1 = 0`.
        ///
        /// It's application endless, showing up in Nature, Art, Music, Architecture, etc.
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Golden_ratio)
        public static let 𝝋: Double = goldenRatio
        
        //MARK: - Medieval and Early Modern
        //TODO: Imaginary Unit (1501 to 1576)
        
        //MARK: Wallis Constant (1616 to 1703)
        /// Wallis Constant commonly represented by `𝑊` (W)
        ///
        /// The real solution to the cubic equation `x^3 - 2x - 5 = 0`.
        public static let wallisConstant: Double = 2.0945_5148_1542_3265_9148
        
        /// Wallis Constant commonly represented by `𝑊` (W)
        ///
        /// The real solution to the cubic equation `x^3 - 2x - 5 = 0`.
        public static let W: Double = wallisConstant
        
        //MARK: Euler's Number (1618)
        /// Euler's Number, commonly represented by `𝑒` (e), is the base of the natrual logarithm as well as the limit of `(1 + 1/n)^n` as `n` approaches infinity.
        ///
        /// It commonly arises in the study of compound interest. It is also can be calculated as the sum of the infinite series `e = ∑_{n = 0}^{∞}(1/n!) = 1 + 1/(1) + 1/(1*2) + 1/(1*2*3) + ...*`
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/E_(mathematical_constant))
        public static let eulersNumber: Double = 2.7182_8182_8459_0452_3536
        
        /// Euler's Number, commonly represented by `𝑒` (e), is the base of the natrual logarithm as well as the limit of `(1 + 1/n)^n` as `n` approaches infinity.
        ///
        /// It commonly arises in the study of compound interest. It is also can be calculated as the sum of the infinite series `e = ∑_{n = 0}^{∞}(1/n!) = 1 + 1/(1) + 1/(1*2) + 1/(1*2*3) + ...*`
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/E_(mathematical_constant))
        public static let e: Double = eulersNumber
        
        //MARK: Sophomore's Dream (1697)
        /// Sophomore's dream is a pair of identites, the first of which, commonly represent by `I_1` (I subscrit 1) is
        /// `∫_{0}^{1}x^{-x} dx = ∑_{n=1}^{∞}n^{-n}`
        /// `∫_{0}^{1}x^{x} dx = ∑_{n=1}^{∞}(-1)^{n+1}n^{-n} = -∑_{n=1}^{∞}(-n)^{-n}`
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Sophomore%27s_dream)
        public static let sophomoresDream_1: Double = 0.7834_3051_0712_1344_0705
        
        /// Sophomore's dream is a pair of identites, the first of which, commonly represent by `I_1` (I subscrit 1) is
        /// `∫_{0}^{1}x^{-x} dx = ∑_{n=1}^{∞}n^{-n}`
        /// `∫_{0}^{1}x^{x} dx = ∑_{n=1}^{∞}(-1)^{n+1}n^{-n} = -∑_{n=1}^{∞}(-n)^{-n}`
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Sophomore%27s_dream)
        public static let I_1: Double = sophomoresDream_1
        
        /// Sophomore's dream is a pair of identites, the second of which, commonly represent by `I_2` (I subscrit 2) is
        /// `∫_{0}^{1}x^{x} dx = ∑_{n=1}^{∞}(-1)^{n+1}n^{-n} = -∑_{n=1}^{∞}(-n)^{-n}`
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Sophomore%27s_dream)
        public static let sophomoresDream_2: Double = 1.2912_8599_7062_6635_4040
        
        /// Sophomore's dream is a pair of identites, the second of which, commonly represent by `I_2` (I subscrit 2) is
        /// `∫_{0}^{1}x^{x} dx = ∑_{n=1}^{∞}(-1)^{n+1}n^{-n} = -∑_{n=1}^{∞}(-n)^{-n}`
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Sophomore%27s_dream)
        public static let I_2: Double = sophomoresDream_2
        
        //MARK: Lemniscate Constant (1718 to 1798)
        /// The Lemniscate constant, commonly represented by `𝜛` (pi symbol) are elliptic functions related to the arc lenth of the [lemniscate of Bernoulli](https://en.wikipedia.org/wiki/Lemniscate_of_Bernoulli).
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Lemniscate_constant)
        public static let lemniscateConstant: Double = 2.6220_5755_4292_1198_1046
        
        /// The Lemniscate constant, commonly represented by `𝜛` (pi symbol) are elliptic functions related to the arc lenth of the [lemniscate of Bernoulli](https://en.wikipedia.org/wiki/Lemniscate_of_Bernoulli).
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Lemniscate_constant)
        public static let 𝜛: Double = lemniscateConstant
        
        //MARK: Euler-Mascheroni Constant (1735)
        /// The Euler–Mascheroni constant, commonly represented by `𝛾` (small gamma), is a mathematical constant occuring in analysis and number theory.
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Euler–Mascheroni_constant)
        public static let eulerMascheroniConstant: Double = 0.5772_1566_4901_5328_6060
        
        /// The Euler–Mascheroni constant, commonly represented by `𝛾` (small gamma), is a mathematical constant occuring in analysis and number theory.
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Euler–Mascheroni_constant)
        public static let 𝛾: Double = eulerMascheroniConstant
        
        //MARK: Erdös-Borwein Constant (1749)
        /// The Erdős–Borwein constant, commonly represented by `𝐸_𝐵` (E subscript B), is the sum of the reciprocals of the Mersenne numbers.
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Erdős–Borwein_constant)
        public static let erdösBorweinConstant: Double = 1.6066_9515_2415_2917_6378
        
        /// The Erdős–Borwein constant, commonly represented by `𝐸_𝐵` (E subscript B), is the sum of the reciprocals of the Mersenne numbers.
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Erdős–Borwein_constant)
        public static let erdosBorweinConstant: Double = erdösBorweinConstant
        
        /// The Erdős–Borwein constant, commonly represented by `𝐸_𝐵` (E subscript B), is the sum of the reciprocals of the Mersenne numbers.
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Erdős–Borwein_constant)
        public static let E_B: Double = erdösBorweinConstant
         
        //MARK: Laplace Limit (~1782)
        /// The Laplace Limit, commonly represeneted by `𝜆` (small lamda), is the maximum value of the eccentricity for which a solution to Kepler's equation.
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Laplace_limit)
        public static let laplaceLimit: Double = 0.6627_4341_9349_1815_8097
        
        /// The Laplace Limit, commonly represeneted by `𝜆` (small lamda), is the maximum value of the eccentricity for which a solution to Kepler's equation.
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Laplace_limit)
        public static let 𝜆: Double = laplaceLimit
        
        //MARK: Gauss's Constant (1799)
        ///The Gauss's constant, commonly represeneted by `𝐺` (G), is defined as the reciprocal of the arithmetic-geometric mean of 1 and the square root of 2.
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Gauss%27s_constant)
        public static let gausssConstant: Double = 0.8346_2684_1674_0731_8628
        
        /// The Gauss's constant, commonly represeneted by `𝐺` (G), is defined as the reciprocal of the arithmetic-geometric mean of 1 and the square root of 2.
        ///
        /// To learn more click [link](https://en.wikipedia.org/wiki/Gauss%27s_constant)
        public static let G: Double = gausssConstant
        
        //MARK: - 19th Century
        //MARK: Ramanujan-Soldner Constant (1812)
        ///Ramanujan–Soldner constant, commonly represeneted by `𝜇` (small mu)
        public static let 𝜇 = 1.45136923488338105028
        
        ///Ramanujan–Soldner constant, commonly represeneted by `𝜇` (small mu)
        public static let ramanujanSoldnerConstant = 1.45136923488338105028
        
        ///The math constant `𝛾_2` (small  gamma subscript 2)
        ///Hermite constant
        public static let 𝛾_2 = 1.15470053837925152901
        
        /// `£_Li` (Pound Sign Subscrip Li)
        ///Liouville number
        //public static let £_Li = 0.110001000000000000000001
        
        /// `𝑅` (R)
        /// Hermite–Ramanujan constant
        public static let R = 262537412640768743.999999999999250073
        
        /// `𝐶` (C)
        /// Catalan's constant
        public static let C = 0.91596559417721901505
        
        
        ///`𝑑` (d)
        ///Dottie number
        public static let d = 0.73908513321516064165
        
        /// `𝑀` (M)
        /// Meissel–Mertens constant
        public static let M = 0.26149721284764278375
        
        /// `𝜎(½)` (small sigma -- one half)
        /// Weierstrass constant
        public static let 𝜎½ = 0.47494937998792065033
        
        //TODO: Hafner–Sarnak–McCurley constant
        
        /// `𝜉_2` (small xi subsicript 2)
        /// Cahen's constant
        public static let 𝜉_2 = 0.64341054628833802618
        
        /// Universal parabolic constant
        /// `𝑃_2` (P subscirpt 2)
        public static let P_2 = 2.29558714939263807403
        
        /// Apéry's constant
        /// `𝜁` (small zeta)
        public static let 𝜁 = 1.20205690315959428539
        
        //TODO: Gelfond's constant
        
        //MARK: - 20th Century
        
        //TODO: Favard constant
        
        /// Golden angle
        /// `𝑏` (b)
        public static let b = 2.39996322972865332223
        
        /// Sierpiński's constant
        /// `𝐊` (K)
        public static let K = 2.58498175957925321706
        
        //TODO: Nielsen–Ramanujan constant
        
        /// Area of the Mandelbrot fractal
        /// `𝛾` (small gamma)
        //FIXME: public static let 𝛾 = 1.5065918849
        
        //TODO: Gieseking constant
        
        //TODO: Bernstein's constant
        
        //TODO: Twin Primes Constant
        
        //TODO: Plastic number
        
        /// Bloch–Landau constant
        public static let L = 0.54325896534297670695
        
        /// Golomb–Dickman constant
        /// `λ` (small lamda)
        //FIXME: public static let λ = 0.62432998854355087099
        
        /// Feller–Tornier constant
        public static let C_FT = 0.66131704946962233528
        
        ///Base 10 Champernowne constant
        public static let C_10 = 0.12345678910111213141
        
        /// Gelfond–Schneider constant
        public static let G_GS = 2.66514414269022518865
        
        /// Khinchin–Lévy constant
        /// `β` (small beta)
        public static let β = 1.18656911041562545282
        
        /// Khinchin-Lévy constant
        /// `e^β`
        //public static let e^β = 3.27582291872181115978
        
        /// Mills' constant
        /// `θ` (small theta)
        public static let 𝜃 = 1.30637788386308069046
        
        //TODO: Van der Pauw constant
        //4.53236014182719380962
        
        /// Magic Angle
        public static let θ_m = 0.955316618124509278163
        
        //TODO: Lochs constant
        //0.97027011439203392574
        
        /// Lieb's square ice constant
        public static let W_2D = 1.53960071783900203869
        
        /// Niven's constant
        //FIXME: public static let C = 1.70521114010536776428
        
        /// Baker constant
        public static let β_3 = 0.83564884826472105333
        
        ///Porter's constant
        //TODO: public static let C = 1.46707807943397547289
        
        /// Feigenbaum constant
        public static let δ = 4.66920160910299067185
        
        //TODO: Chaitin's constants
        
        /// Fransén–Robinson constant[70]
        public static let F = 2.80777024202851936522
        
        /// Robbins constant
        /// Δ(3)
        //TODO: public static let Δ(3) = 0.66170718226717623515
        
        /// Feigenbaum constant
        public static let α = 2.50290787509589282228
        
        /// Connective constant
        public static let μ = 1.84775906502257351225
        
        /// Lehmer's conjecture constant
        public static let σ_10 = 1.17628081825991750654
        
        /// Chebyshev constant
        public static let λ_Ch = 0.59017029950804811302
        
        /// Conway constant
        public static let λ = 1.30357726903429639125
        
        /// Prévost constant, Reciprocal Fibonacci constant
        public static let Ψ = 3.35988566624317755317
        
        /// Brun 2 constant = Σ inverse of Twin primes
        public static let B_2 = 1.902160583104
        
        /// Hafner–Sarnak–McCurley constant
        public static let σ = 0.35323637185499598454
        
        /// Backhouse's constant[86]
        public static let B = 1.45607494858268967139
        
        /// Viswanath constant
        public static let C_Vi = 1.1319882487943
        
        /// Time constant
        public static let τ = 0.63212055882855767840
        
        /// Komornik–Loreti constant
        public static let q = 1.78723165018296593301
        
        /// Regular paperfolding sequence
        public static let P_f = 0.85073618820186726036
        
        /// Artin constant
        public static let C_Artin = 0.37395581361920228805
        
        /// MRB constant
        public static let C_MRB = 0.18785964246206712024
        
        /// Somos' quadratic recurrence constant
        //FIXME: public static let σ = 1.66168794963359412129
        
        //MARK: - 21st Century
        ///Foias constant α (alpha)
        public static let F_α = 1.18745235112650105459
        
        /// Foias constant β (beta)
        public static let F_β = 2.29316628741186103150
        
        /// Raabe's formula
        //TODO: public static let ζ'(0) = 0.91893853320467274178
        
        /// Kepler–Bouwkamp constant
        public static let ρ = 0.11494204485329620070
        
        /// Prouhet–Thue–Morse constant
        //FIXME: public static let τ = 0.41245403364010759778
        
        ///Heath-Brown–Moroz constant
        public static let C_HBM = 0.00131764115485317810
        
        /// Lebesgue constant
        public static let C_1 = 0.98943127383114695174
        
        /// 2nd du Bois-Reymond constant
        public static let C_2 = 0.19452804946532511361
        
        /// Stephens constant
        public static let C_S = 0.57595996889294543964
        
        /// Taniguchi Constant
        public static let C_T = 0.67823449191739197803
        
        /// Copeland–Erdős constant
        public static let C_CE = 0.23571113171923293137
        
        /// Hausdorff dimension, Sierpinski triangle
        public static let log_2_3 = 1.58496250072115618145
        
        /// Landau–Ramanujan constant
        //FIXME: public static let K = 0.76422365358922066299
        
        /// Brun 4 constant = Σ inv.prime quadruplets
        public static let B_4 = 0.870588379975
        
        /// Ramanujan nested radical
        public static let R_5 = 2.74723827493230433305
        
        /// Slowly convergent series constant
        public static let a_2 = 2.10974280123689197447
    }
}
