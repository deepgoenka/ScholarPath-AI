from scholarpath.__main__ import main


def test_main() -> None:
    """Verify that the main application entry point exists."""
    assert callable(main)
