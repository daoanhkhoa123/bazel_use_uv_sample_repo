import sys

import cv2
import numpy as np
import torch
import matplotlib
import matplotlib.pyplot as plt


def test_libraries():
    print("PYTHON:", sys.executable)
    print("VERSION:", sys.version)

    print("\n========== Library Test ==========\n")

    # ------------------------------------------------------------------
    # OpenCV
    # ------------------------------------------------------------------
    print("----- OpenCV -----")
    print(f"OpenCV version: {cv2.__version__}")

    img = np.zeros((5, 5, 3), dtype=np.uint8)
    img[:, :] = [255, 0, 0]  # Blue image (BGR)

    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    print("Original image shape:", img.shape)
    print("Grayscale matrix:")
    print(gray)
    print()

    # ------------------------------------------------------------------
    # NumPy
    # ------------------------------------------------------------------
    print("----- NumPy -----")
    print(f"NumPy version: {np.__version__}")

    A = np.array([[1, 2],
                  [3, 4]])

    B = np.array([[5, 6],
                  [7, 8]])

    C = A @ B

    print("Matrix A:")
    print(A)

    print("Matrix B:")
    print(B)

    print("A @ B:")
    print(C)
    print()

    # ------------------------------------------------------------------
    # PyTorch
    # ------------------------------------------------------------------
    print("----- PyTorch -----")
    print(f"PyTorch version: {torch.__version__}")

    device = "cuda" if torch.cuda.is_available() else "cpu"

    print("Device:", device)

    if torch.cuda.is_available():
        print("CUDA device:", torch.cuda.get_device_name(0))

    x = torch.tensor([[1., 2.],
                      [3., 4.]], device=device)

    y = torch.tensor([[5., 6.],
                      [7., 8.]], device=device)

    z = x @ y

    print("Tensor x:")
    print(x)

    print("Tensor y:")
    print(y)

    print("x @ y:")
    print(z)
    print()

    # ------------------------------------------------------------------
    # Matplotlib
    # ------------------------------------------------------------------
    print("----- Matplotlib -----")
    print(f"Matplotlib version: {matplotlib.__version__}")

    x_vals = [1, 2, 3, 4, 5]
    y_vals = [1, 4, 9, 16, 25]

    plt.figure(figsize=(5, 3))
    plt.plot(x_vals, y_vals, marker='o')
    plt.title("Matplotlib Test")
    plt.xlabel("x")
    plt.ylabel("x²")
    plt.grid(True)

    plt.show()
    print("========== ALL TESTS COMPLETED ==========")


if __name__ == "__main__":
    test_libraries()