# Python 代码风格规范

## 文件组织

- **文件大小**：200-400 行典型，800 行上限
- **函数大小**：<50 行
- **嵌套深度**：<4 层
- **组织方式**：按功能/领域，不按类型

## 命名规范

```python
# 变量和函数：snake_case
user_name = "John"
def get_user_by_id(user_id): ...

# 类：PascalCase
class UserService: ...

# 常量：UPPER_SNAKE_CASE
MAX_RETRY_COUNT = 3
```

## 类型注解（推荐）

```python
def process_data(items: list[dict]) -> dict[str, Any]:
    ...
```

## 错误处理

```python
# ✅ 正确：具体异常 + 有意义的消息
try:
    result = api.fetch_data()
except requests.RequestException as e:
    logger.error(f"API 请求失败: {e}")
    raise DataFetchError(f"无法获取数据: {e}") from e

# ❌ 错误：裸 except
try:
    result = api.fetch_data()
except:
    pass
```

## 不可变性优先

```python
# ✅ 正确：返回新对象
def update_user(user: dict, name: str) -> dict:
    return {**user, "name": name}

# ❌ 错误：直接修改
def update_user(user: dict, name: str) -> dict:
    user["name"] = name  # 修改了原对象！
    return user
```

## 提交前检查清单

- [ ] 无 `print()` 调试语句
- [ ] 无硬编码密钥/密码
- [ ] 有类型注解（至少函数签名）
- [ ] 有 docstring（公开函数）
- [ ] 无 `# TODO` 遗留
- [ ] 无深层嵌套 (>4层)
