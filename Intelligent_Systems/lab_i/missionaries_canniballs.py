# the initial and the goal states
init_state = (3, 3, True)
goal_state = (0, 0, False)


# function to print
def print_state(state):
    (m, c, b) = state
    print(f'State: {m}, {c}, {b}')


# function to deduce what is the current state of the right side
def right_side(state):
    (m, c, b) = state
    return 3 - m, 3 - c, not b


# determine what are the possible moves from the current state
def possible_moves(state):
    (m, c, b) = state
    diff = [(1, 0), (2, 0), (0, 1), (0, 2), (1, 1)]
    res = []

    if b:
        for (dm, dc) in diff:
            m_1 = m - dm
            c_1 = c - dc
            if m_1 < 0 or c_1 < 0:
                continue
            else:
                res.append((m_1, c_1, not b))
    else:
        for (dm, dc) in diff:
            m_1 = m + dm
            c_1 = c + dc
            if m_1 > 3 or c_1 > 3:
                continue
            else:
                res.append((m_1, c_1, not b))
    return res


# checks if the given state of the side is valid
def valid_state(state):
    m, c, _ = state
    if m < 0 or c < 0 or m > 3 or c > 3:
        return False
    if 0 < m < c:
        return False
    return True


# main function
def solve(state, final_state, visited=None):
    if visited is None:
        visited = [state]
    if state == final_state:
        return [state]

    for p in possible_moves(state):
        if not valid_state(p) or not valid_state(right_side(p)):
            continue
        if p in visited:
            continue
        solution = solve(p, final_state, visited + [p])
        if solution:
            return [state] + solution
    return []


# solution
print(solve(init_state, goal_state))
