<?php
require_once "db.php";

$pdo->exec("
CREATE TABLE IF NOT EXISTS students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
");

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $stmt = $pdo->prepare("INSERT INTO students (first_name, last_name, email) VALUES (?, ?, ?)");
    $stmt->execute([
        $_POST["first_name"],
        $_POST["last_name"],
        $_POST["email"]
    ]);

    header("Location: /");
    exit;
}

$students = $pdo->query("SELECT * FROM students ORDER BY id DESC")->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <title>3tier-beanstalk CICD</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        input { padding: 8px; margin: 5px; }
        button { padding: 8px 14px; }
        table { border-collapse: collapse; margin-top: 25px; width: 100%; }
        th, td { border: 1px solid #ccc; padding: 10px; }
    </style>
</head>
<body>
    <h1>3tier-beanstalk</h1>
    <p>PHP 8 + Nginx + Elastic Beanstalk + RDS MySQL</p>

    <h2>Add Student</h2>
    <form method="POST">
        <input name="first_name" placeholder="First Name" required>
        <input name="last_name" placeholder="Last Name" required>
        <input name="email" type="email" placeholder="Email" required>
        <button type="submit">Add Student</button>
    </form>

    <h2>Students</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Created</th>
        </tr>
        <?php foreach ($students as $student): ?>
        <tr>
            <td><?= htmlspecialchars($student["id"]) ?></td>
            <td><?= htmlspecialchars($student["first_name"]) ?></td>
            <td><?= htmlspecialchars($student["last_name"]) ?></td>
            <td><?= htmlspecialchars($student["email"]) ?></td>
            <td><?= htmlspecialchars($student["created_at"]) ?></td>
        </tr>
        <?php endforeach; ?>
    </table>
</body>
</html>