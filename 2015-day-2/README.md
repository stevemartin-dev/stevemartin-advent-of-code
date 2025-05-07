# Advent of Code - Day 2: I Was Told There Would Be No Math

## Problem Description

### Part 1: Wrapping Paper Calculation
The elves need to calculate the required wrapping paper for each gift box (perfect right rectangular prism) with dimensions (l×w×h). The formula is:
- Surface area: `2*l*w + 2*w*h + 2*h*l`
- Plus extra: area of the smallest side

**Examples:**
- 2×3×4 requires 52 + 6 = 58 square feet
- 1×1×10 requires 42 + 1 = 43 square feet

### Part 2: Ribbon Calculation
The elves also need ribbon:
- Ribbon length: shortest perimeter of any face
- Plus bow length: cubic feet volume of the present (`l × w × h`)

**Examples:**
- 2×3×4 requires 10 + 24 = 34 feet
- 1×1×10 requires 4 + 10 = 14 feet

## Solution Approach

### Key Insights
- **Wrapping Paper**: Calculate surface area plus smallest side area
- **Ribbon**: Find smallest perimeter plus volume

### Implementation
```ruby
def calculate_wrapping_paper(dimensions_list)
  total_paper = 0
  dimensions_list.each do |dimensions|
    l, w, h = dimensions.split('x').map(&:to_i)
    side1 = l * w
    side2 = w * h
    side3 = h * l
    surface_area = 2 * (side1 + side2 + side3)
    smallest_side = [side1, side2, side3].min
    total_paper += surface_area + smallest_side
  end
  total_paper
end

def calculate_ribbon(dimensions_list)
  total_ribbon = 0
  dimensions_list.each do |dimensions|
    l, w, h = dimensions.split('x').map(&:to_i)
    perimeters = [2*(l+w), 2*(w+h), 2*(h+l)]
    smallest_perimeter = perimeters.min
    volume = l * w * h
    total_ribbon += smallest_perimeter + volume
  end
  total_ribbon
end
```

## Development Notes

The solution was independently developed with:

- Manual implementation of the mathematical formulas
- Careful handling of input parsing
- Efficient calculation of smallest sides/perimeters