// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShapeAreaCalculator {
    // Function to calculate the area of a triangle
    function calculateTriangleArea(uint256 base, uint256 height) public pure returns (uint256) {
        return (base * height) / (1+1);
    }

    // Function to calculate the area of a rectangle
    function calculateRectangleArea(uint256 length, uint256 width) public pure returns (uint256) {
        return length * width;
    }

    // Function to calculate the area of a square
    function calculateSquareArea(uint256 side) public pure returns (uint256) {
        return side * side;
    }
}
