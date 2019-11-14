/*
 Copyright (c) 2019, Apple Inc. All rights reserved.

 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:

 1.  Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.

 2.  Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation and/or
 other materials provided with the distribution.

 3. Neither the name of the copyright holder(s) nor the names of any contributors
 may be used to endorse or promote products derived from this software without
 specific prior written permission. No license is granted to the trademarks of
 the copyright holders even if such marks are included in this software.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

extension UILayoutPriority {
    static var almostRequired: UILayoutPriority {
        return .required - 1
    }
}

extension NSLayoutConstraint {
    func withPriority(_ new: UILayoutPriority) -> NSLayoutConstraint {
        priority = new
        return self
    }
}

extension UIView {
    func setContentHuggingPriorities(_ new: UILayoutPriority) {
        setContentHuggingPriority(new, for: .horizontal)
        setContentHuggingPriority(new, for: .vertical)
    }

    func setContentCompressionResistancePriorities(_ new: UILayoutPriority) {
        setContentCompressionResistancePriority(new, for: .horizontal)
        setContentCompressionResistancePriority(new, for: .vertical)
    }

    func constraints(equalTo other: UIView) -> [NSLayoutConstraint] {
        return [
            topAnchor.constraint(equalTo: other.topAnchor),
            leftAnchor.constraint(equalTo: other.leftAnchor),
            bottomAnchor.constraint(equalTo: other.bottomAnchor),
            rightAnchor.constraint(equalTo: other.rightAnchor)
        ]
    }

    func constraints(equalTo layoutGuide: UILayoutGuide) -> [NSLayoutConstraint] {
        return [
            topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            leftAnchor.constraint(equalTo: layoutGuide.leftAnchor),
            bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
            rightAnchor.constraint(equalTo: layoutGuide.rightAnchor)
        ]
    }

    var isRightToLeft: Bool {
        return UIView.userInterfaceLayoutDirection(for: semanticContentAttribute) == .rightToLeft
    }
}
