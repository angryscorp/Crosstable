//
//  SettingsViewController.swift
//  Crosstable
//
//  Created by Antony Karpov on 17.04.2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    // Settings of Crosstable
    private var currentSettings = CrosstableSettings.default

    // MARK: IB OUTLETS

    @IBOutlet private weak var titleNumberOfRows: UILabel!
    @IBOutlet private weak var titleNumberOfColumns: UILabel!
    @IBOutlet private weak var titleWidthOfCell: UILabel!
    @IBOutlet private weak var titleHeightOfCell: UILabel!
    @IBOutlet private weak var sliderNumberOfRows: UISlider!
    @IBOutlet private weak var sliderNumberOfColumns: UISlider!
    @IBOutlet private weak var sliderWidthOfCell: UISlider!
    @IBOutlet private weak var sliderHeightOfCell: UISlider!
    @IBOutlet private weak var switchColoring: UISwitch!
    @IBOutlet private weak var switchFixFirstRowColumn: UISwitch!

    // MARK: IB ACTIONS

    @IBAction private func numberOfRows(_ sender: UISlider) {
        currentSettings.numberOfRows = Int(sender.value)
        updateNumberOfRows()
    }

    @IBAction private func numberOfColumns(_ sender: UISlider) {
        currentSettings.numberOfColumns = Int(sender.value)
        updateNumberOfColumns()
    }

    @IBAction private func widthOfCell(_ sender: UISlider) {
        currentSettings.widthOfCell = Int(sender.value)
        updateTitleWidthOfCell()
    }

    @IBAction private func heightOfCell(_ sender: UISlider) {
        currentSettings.heightOfCell = Int(sender.value)
        updateTitleHeightOfCell()
    }

    @IBAction private func switchColoring(_ sender: UISwitch) {
        currentSettings.coloring = sender.isOn
    }

    @IBAction private func switchFixFirstRowColumn(_ sender: UISwitch) {
        currentSettings.fixFirstRowColumn = sender.isOn
    }

    // MARK: LIFE CYCLE OF VIEW CONTROLLER

    override func viewDidLoad() {
        super.viewDidLoad()
        setStartValues()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CrosstableViewController {
            vc.setNewSettings(currentSettings)
        }
    }

}

extension SettingsViewController {

    // MARK: UPDATE UI

    private func updateNumberOfRows() {
        titleNumberOfRows.text = String(currentSettings.numberOfRows)
    }

    private func updateNumberOfColumns() {
        titleNumberOfColumns.text = String(currentSettings.numberOfColumns)
    }

    private func updateTitleWidthOfCell() {
        titleWidthOfCell.text = String(currentSettings.widthOfCell)
    }

    private func updateTitleHeightOfCell() {
        titleHeightOfCell.text = String(currentSettings.heightOfCell)
    }

    private func setStartValues() {
        sliderNumberOfRows.value = Float(currentSettings.numberOfRows)
        sliderNumberOfColumns.value = Float(currentSettings.numberOfColumns)
        sliderWidthOfCell.value = Float(currentSettings.widthOfCell)
        sliderHeightOfCell.value = Float(currentSettings.heightOfCell)
        switchColoring.isOn = currentSettings.coloring
        switchFixFirstRowColumn.isOn = currentSettings.fixFirstRowColumn
        updateNumberOfRows()
        updateNumberOfColumns()
        updateTitleWidthOfCell()
        updateTitleHeightOfCell()
    }

}
