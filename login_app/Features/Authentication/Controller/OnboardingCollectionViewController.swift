//
//  OnboardingCollectionViewController.swift
//  login_app
//
//  Created by Thiago Matheus on 03/07/20.
//  Copyright © 2020 Thiago Matheus. All rights reserved.
//

import UIKit

class OnboardingCollectionViewController: UICollectionViewController {

    private let pages = OnboardingModelFactory.getPages()

    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = pages.count
        return pageControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addPageControlToView()
    }

    private func addPageControlToView() {
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}

extension OnboardingCollectionViewController {

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.reuseIdentifier, for: indexPath)
            as? OnboardingCollectionViewCell else { fatalError("Could not cast dequeued cell") }
        cell.fill(with: pages[indexPath.row])
        return cell
    }

}

extension OnboardingCollectionViewController: UICollectionViewDelegateFlowLayout {

    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }

    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
    }

}
