//
//  File.swift
//  File
//
//  Created by Logan Richards on 10/6/21.
//

import Foundation

//TODO: Should I do intalic "𝑒" or just "e"
//TODO: Should I do symbol π or just "pi"
extension MATH {
    
    ///[link](https://en.wikipedia.org/wiki/List_of_mathematical_constants)
    public struct Constants {
        
        //MARK: - Antiquity
        /// `π` (small pi)
        /// The ratio between the diameter and circumfernce of a circle.
        public static let π: Double = 3.1415_9265_3589_7932_3846
        
        /// `π` (small pi)
        /// The ratio between the diameter and circumfernce of a circle.
        public static let pi: Double = 3.1415_9265_3589_7932_3846
        
        /// `𝝋` (small phi).
        /// The golden ratio
        public static let 𝝋: Double = 1.61803398874989484820
        
        /// `𝝋` (small phi).
        /// The golden ratio
        public static let phi: Double = 1.61803398874989484820
        
        //MARK: - Medievall and Early Modern
        ///The math constant `𝑊` (W)
        ///Wallis Constant
        public static let W: Double = 2.09455148154232659148
        
        ///The math constant  `𝑒` (e)
        ///Euler's number
        public static let e: Double = 2.71828182845904523536
        
        /// Sophomore's dream 1
        /// `𝐼_1` (I subscript 1)
        public static let I_1: Double = 0.78343051071213440705
        
        /// Sophomore's dream 2
        /// `𝐼_2` (I subscript 2)
        public static let I_2 = 1.29128599706266354040
        
        ///The math constant `𝜛` (pi symbol)
        ///Lemniscate constant
        public static let 𝜛 = 2.62205755429211981046
        
        ///The math constant `𝛾` (small gamma).
        ///Euler–Mascheroni constant
        public static let 𝛾 = 0.57721566490153286060
        
        /// Erdős–Borwein constant
        /// `𝐸_𝐵` (E subscript B)
        public static let E_B = 1.60669515241529176378
        
        ///The math constant `𝜆` (small lamda).
        ///Laplace Limit
        public static let 𝜆 = 0.66274341934918158097
        
        ///The math constant `𝐺` (G).
        ///Gauss's constant
        public static let G = 0.83462684167407318628
        
        //MARK: - 19th Century
        ///The math constant `𝜇` (small mu)
        ///Ramanujan–Soldner constant
        public static let 𝜇 = 1.45136923488338105028
        
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
