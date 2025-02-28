import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    var memoList: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupTableView()
        setupAddButton()
        loadMemoList()
    }

    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }

    func setupAddButton() {
        let addButton = UIButton(type: .system)
        addButton.setTitle("+", for: .normal)
        addButton.frame = CGRect(x: view.frame.width - 110, y: 40, width: 100, height: 30)
        addButton.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
        addButton.addTarget(self, action: #selector(addMemo), for: .touchUpInside)
        view.addSubview(addButton)
    }

    @objc func addMemo() {
        // UIAlertController를 사용하여 메모 입력 받기
        let alert = UIAlertController(title: "새 메모", message: "메모를 입력하세요.", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "메모 내용"
        }
        let addAction = UIAlertAction(title: "추가", style: .default) { [weak self] _ in
            guard let self = self,
                  let memo = alert.textFields?.first?.text,
                  !memo.isEmpty else { return }
            self.memoList.append(memo)
            self.tableView.reloadData()
            self.saveMemoList()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)

        alert.addAction(addAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
                   ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = memoList[indexPath.row]
        return cell
    }

    // MARK: - 메모 삭제 기능 (스와이프 제스처)

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            memoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveMemoList()
        }
    }

    // MARK: - 데이터 저장 및 불러오기

    func saveMemoList() {
        UserDefaults.standard.set(memoList, forKey: "memoList")
    }

    func loadMemoList() {
        if let savedMemoList = UserDefaults.standard.array(forKey: "memoList") as? [String] {
            memoList = savedMemoList
            tableView.reloadData()
        }
    }
}

