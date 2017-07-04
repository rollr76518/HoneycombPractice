//
//  ViewController.swift
//  HoneycombPractice
//
//  Created by Hanyu on 2017/7/3.
//  Copyright © 2017年 Hanyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var collectionView: UICollectionView!

	let cellID = "HoneycombCollectionViewCell"
	let cellWidth = (UIScreen.main.bounds.width - 3)/4
	let cellHeight = (UIScreen.main.bounds.width - 3)/4 * 240/156
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.register(UINib.init(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 100
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
	{
		if section%2 == 0 {
			return 4
		}
		else {
			return 3
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
	{
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HoneycombCollectionViewCell
		
		cell.imageView.image = #imageLiteral(resourceName: "SB_SFX_Balloon_Cell_nested")
		cell.label.text = String(describing: indexPath)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = cellWidth
		let height = cellHeight
		
		return CGSize.init(width: width, height: height)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return -(cellHeight/2)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		if section%2 == 0 {
			let insets = UIEdgeInsets.init(top: 0, left: 0, bottom: -(cellHeight/2), right: 0)
			return insets
		}
		else {
			let insets = UIEdgeInsets.init(top: 0, left: cellWidth/2, bottom: -(cellHeight/2), right: cellWidth/2)
			return insets
		}
	}
	
}
