//
//  HoneycombCollectionViewCell.swift
//  HoneycombPractice
//
//  Created by Hanyu on 2017/7/3.
//  Copyright © 2017年 Hanyu. All rights reserved.
//

import UIKit

class HoneycombCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var label: UILabel!
	var path:UIBezierPath!

    override func awakeFromNib()
	{
        super.awakeFromNib()
		
		backgroundView = UIImageView.init(image: #imageLiteral(resourceName: "SB_Music_Balloon_Cell_nested"))
		selectedBackgroundView = UIImageView.init(image: #imageLiteral(resourceName: "SB_REC_Balloon_Cell_nested"))
    }
	
	override func draw(_ rect: CGRect) {
		super.draw(rect)
		
		path = UIBezierPath.init(rect: CGRect.init(x: frame.size.width/2, y: 0, width: 0, height: 0))
		path.addLine(to: CGPoint.init(x: 0, y: frame.size.height/2))
		path.addLine(to: CGPoint.init(x: frame.size.width/2, y: frame.size.height))
		path.addLine(to: CGPoint.init(x: frame.size.width, y: frame.size.height/2))
		path.close()
		path.lineWidth = 1.0
		UIColor.green.setStroke()//展示用，請自行拿掉
		path.stroke()
	}
	
	override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
		if path.contains(point) {
			return true
		}
		else {
			return false
		}
	}
}
